class UsersController < ApplicationController

  # skip_before_action :authorized, only: [:new, :create]
  def show
    @user = User.find(session[:user_id])
  end

  def new
    if session[:user_id] and !User.find(session[:user_id]).nil?
      return redirect_to '/welcome'
    end
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
    @user = User.find(session[:user_id])
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