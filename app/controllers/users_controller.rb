class UsersController < ApplicationController

  # skip_before_action :authorized, only: [:new, :create]
  def show
    @user = current_user
    @foodtrucks = Foodtruck.where(user_id: current_user.id)
    user_id = current_user.id
    @orders = []

    # the orders that I placed
    my_placed_order = Order.where("user_id = #{user_id}")
    if !my_placed_order.nil? && !my_placed_order.empty?
      @orders.concat(my_placed_order)
    end

    # the orders that placed to my truck
    if !@foodtrucks.nil? && !@foodtrucks.empty?
      @foodtrucks.each do |truck|
        my_truck_order = Order.where("truck_id = #{truck.id}")
        if !my_truck_order.nil? && !my_truck_order.empty?
          @orders.concat(my_truck_order)
        end
      end
    end
  end

  def new
    return redirect_to '/welcome' if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone)
  end
end