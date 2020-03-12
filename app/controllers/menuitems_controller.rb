class MenuitemsController < ApplicationController
  before_action :not_my_truck, except: [:add, :remove]
  before_action :is_my_truck, only: [:add, :remove]

  def edit
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.find(params[:id])
  end

  def create
    @menuitem_errors = []
    success = true
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @menuitem = @foodtruck.menuitems.new(menuitem_params)

    if @menuitem.Name.nil?
      @menuitem_errors.push("Item name can't be blank.")
      success = false
    end
    if @menuitem.price.nil?
      @menuitem_errors.push("Item price can't be blank.")
      success = false
    end
    if success
      @menuitem.save
      redirect_to foodtruck_path(@foodtruck)
    else
      redirect_to edit_foodtruck_path(@foodtruck)
    end
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
    truck = Foodtruck.where("id = #{params['foodtruck_id']}")
    if truck.nil? || truck.empty?
      logger.warn 'No food truck found'
      return
    end
    truck = truck[0]
    @foodtruck = truck
    logger.info "truck: #{@foodtruck.as_json}"

    menu_item = Menuitem.where("id = #{params['menuitem_id']}")
    if menu_item.nil? || menu_item.empty?
      logger.warn 'No menu item found'
      return
    end
    @menuitem = menu_item[0]

    item_id = @menuitem.id.to_s

    key = "#{current_user.id}_#{truck.id}"
    user_cart_str = $redis.get key
    if user_cart_str.nil?
      user_cart_str = '{}'
    end

    user_cart = eval(user_cart_str)

    if user_cart.key?(item_id)
      user_cart[item_id][:quantity] += 1
    else
      new_item = {}
      new_item[:item_id] = @menuitem.id
      new_item[:item_name] = @menuitem.Name
      new_item[:item_price] = @menuitem.price
      new_item[:item_img] = ''
      new_item[:quantity] = 1
      user_cart[item_id] = new_item
    end

    $redis.set(key, user_cart.inspect)

    logger.info "user cart: #{user_cart}"
    @cart = user_cart.nil? ? {} : user_cart

    render '/foodtrucks/show'
  end

  def remove
    truck = Foodtruck.where("id = #{params['foodtruck_id']}")
    if truck.nil? || truck.empty?
      logger.warn 'No food truck found'
      return
    end
    truck = truck[0]
    @foodtruck = truck

    menu_item = Menuitem.where("id = #{params['menuitem_id']}")
    if menu_item.nil? || menu_item.empty?
      logger.warn 'No menu item found'
      return
    end
    @menuitem = menu_item[0]

    item_id = @menuitem.id.to_s

    key = "#{current_user.id}_#{truck.id}"
    user_cart_str = $redis.get key
    if user_cart_str.nil?
      user_cart_str = '{}'
    end

    user_cart = eval(user_cart_str)

    if user_cart.key?(item_id)
      if user_cart[item_id][:quantity].positive?
        user_cart[item_id][:quantity] -= 1
      end
      user_cart.delete(item_id) if user_cart[item_id][:quantity].zero?
    end

    $redis.set(key, user_cart.inspect)

    @cart = user_cart.nil? ? {} : user_cart

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
