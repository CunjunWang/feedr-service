class UsersController < ApplicationController

  # skip_before_action :authorized, only: [:new, :create]

  def new
    if session[:user_id] and !User.find(session[:user_id]).nil?
      return redirect_to '/welcome'
    end
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :first_name, :last_name, :phone))
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render 'new'
    end
  end

  def test

  end
end