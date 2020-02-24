class MenuitemsController < ApplicationController
  before_action :is_my_truck
  def edit
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.find(params[:id])
  end

  def create
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.create(menuitem_params)
    redirect_to foodtruck_path(@foodtruck)
  end

  def destroy
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.find(params[:id])
    if @foodtruck.user_id == current_user.id
      @menuitem.destroy
    end
    redirect_to foodtruck_path(@foodtruck)
  end

  def update
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.find(params[:id])
    @menuitem.update(menuitem_params)
  end

  def add
    found = 0
    @foodtruck = Foodtruck.find_by(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.find(params[:menuitem_id])

    logger.info "menu item id: #{@menuitem[:id]}"
    logger.info "In add: session items = #{session[:items]}"

    session[:items].each do |item|
      logger.info "menuitem name: #{@menuitem[:Name]}"
      logger.info "item name: #{item["item_name"]}"
      if @menuitem[:Name].eql? item["item_name"]
        item["quantity"] += 1
        found = 1
      end
    end
    if found == 0
      new_item = {}
      new_item[:item_id] = @menuitem.id
      new_item[:item_name] = @menuitem.Name
      new_item[:item_price] = @menuitem.price
      new_item[:item_img] = ""
      new_item[:quantity] = 1
      session[:items].push(new_item)
    end

    logger.info "In add before redirect: session items = #{session[:items]}"

      # render  "/foodtrucks/#{params[:foodtruck_id]}"
    render '/foodtrucks/show'
  end

  def remove
    @foodtruck = Foodtruck.find_by(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.find(params[:menuitem_id])

      # logger.info "In remove: session items = #{session[:items]}"

    session[:items].each do |item|
      if @menuitem[:Name].eql? item["item_name"]
        item["quantity"] -= 1
        if item["quantity"] == 0
          session[:items].delete(item)
        end
      end
    end

    logger.info "After remove: session items = #{session[:items]}"

      # redirect_to  "/foodtrucks/#{params[:foodtruck_id]}"
    render '/foodtrucks/show'
  end

    private
  def menuitem_params
    params.require(:menuitem).permit(:Name, :Description, :price)
  end

  def is_my_truck
    if !logged_in? || Foodtruck.find_by(params[:foodtruck_id]).user_id != current_user.id
      redirect_to '/'
    end
  end
end
