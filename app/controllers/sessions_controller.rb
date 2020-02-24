class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
    return redirect_to '/welcome' if logged_in?
    @user = User.new
  end

  def create # user login, create user session
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render 'new'
    end
  end

  def login;
  end

  def welcome;
    @foodtrucks = if !logged_in?
                    Foodtruck.all
                  else
                    Foodtruck.where('user_id != ?', current_user.id)
                  end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
