class MenuitemsController < ApplicationController
  before_action :not_my_truck, except: [:add, :remove]
  before_action :is_my_truck, only: [:add, :remove]

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
    @menuitem.destroy
    redirect_to foodtruck_path(@foodtruck)
  end

  def update
    # @menuitem = @foodtruck.menuitems.find(params[:id])
    @menuitem = Menuitem.find(params[:id])
    @menuitem.update(menuitem_params)
    redirect_to Foodtruck.find(@menuitem.foodtruck_id)
  end

  def add
    found = 0

    foodtruck = Foodtruck.where("id = #{params['foodtruck_id']}")
    if foodtruck.nil? || foodtruck.empty?
      logger.warn "No food truck found"
      return
    end
    @foodtruck = foodtruck[0]

    menuitem = Menuitem.where("id = #{params['menuitem_id']}")
    if menuitem.nil? || menuitem.empty?
      logger.warn "No menu item found"
      return
    end
    @menuitem = menuitem[0]

    logger.info "menu item id: #{@menuitem[:id]}"
    logger.info "In add: session items = #{session[:items]}"

    item_id = @menuitem.id.to_s
    if session[:items].key?(item_id)
      session[:items][item_id]["quantity"] += 1
    else
      new_item = {}
      new_item[:item_id] = @menuitem.id
      new_item[:item_name] = @menuitem.Name
      new_item[:item_price] = @menuitem.price
      new_item[:item_img] = ""
      new_item[:quantity] = 1
      session[:items][item_id] = new_item
    end
    # session[:items].each do |item|
    #   logger.info "menuitem name: #{@menuitem[:Name]}"
    #   logger.info "item name: #{item["item_name"]}"
    #   if @menuitem[:Name].eql? item["item_name"]
    #     item["quantity"] += 1
    #     found = 1
    #   end
    # end
    # if found == 0
    #   new_item = {}
    #   new_item[:item_id] = @menuitem.id
    #   new_item[:item_name] = @menuitem.Name
    #   new_item[:item_price] = @menuitem.price
    #   new_item[:item_img] = ""
    #   new_item[:quantity] = 1
    #   session[:items].push(new_item)
    # end

    logger.info "In add before redirect: session items = #{session[:items]}"

    # render  "/foodtrucks/#{params[:foodtruck_id]}"
    render '/foodtrucks/show'
  end

  def remove
    @foodtruck = Foodtruck.find_by(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.find(params[:menuitem_id])

    # logger.info "In remove: session items = #{session[:items]}"

    # session[:items].each do |item|
    #   if @menuitem[:Name].eql? item["item_name"]
    #     item["quantity"] -= 1
    #     if item["quantity"] == 0
    #       session[:items].delete(item)
    #     end
    #   end
    # end
    item_id = @menuitem.id.to_s
    if session[:items].key?(item_id)
      if session[:items][item_id]['quantity'] > 0
        session[:items][item_id]['quantity'] -= 1
      elsif session[:items][item_id]['quantity'] == 0
        session[:items].delete(item_id)
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

  def get_truck_id
    if params[:foodtruck_id].nil?
      return Menuitem.find(params[:id]).foodtruck_id
    end
    return params[:foodtruck_id]
  end

  def not_my_truck
    if !logged_in? || Foodtruck.find(get_truck_id).user_id != current_user.id
      redirect_to '/'
    end
  end

  def is_my_truck
    if logged_in? && Foodtruck.find(get_truck_id).user_id == current_user.id
      redirect_to '/'
    end
  end
end
