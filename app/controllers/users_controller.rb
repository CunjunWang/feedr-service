include OrdersHelper

class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def show
    @user = current_user
    @foodtrucks = Foodtruck.where(user_id: current_user.id).order(:created_at)
    user_id = current_user.id
    @orders = get_all_my_orders(@foodtrucks, user_id, 5)
    @foodtrucks_ordered = []
    @orders.each do |order|
      @foodtrucks_ordered.push(Foodtruck.find(order.truck_id).Name) unless Foodtruck.find(order.truck_id).nil?
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
    @user.avatar.attach(params[:avatar])
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
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone, :avatar)
  end
end