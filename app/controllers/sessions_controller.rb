class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
    if session[:user_id] && !User.find_by(id: session[:user_id]).nil?
      redirect_to '/welcome'
    end
  end

  def create # user login, create user session
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/login'
    end
  end

  def login
  end

  def welcome
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
