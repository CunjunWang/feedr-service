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
    if params['Name'] && params['Name'].strip != ''
      @foodtrucks = @foodtrucks.where("\"Name\" like ?", "%#{params['Name'].strip}%")
      # @foodtrucks = @foodtrucks.where(Name: params['Name'])
    end


    if params['Type'] && params['Type'] != 'Type (All)'
      @foodtrucks = @foodtrucks.where(Type: params['Type'])
    end

    if params['Address'] && params['Address'].strip != ''
      @foodtrucks = @foodtrucks.where("\"Address\" like ?", "%#{params['Address'].strip}%")
    end
    if params['Description'] && params['Description'].strip != ''
      @foodtrucks = @foodtrucks.where("\"Description\" like ?", "%#{params['Description'].strip}%")
    end
    if params['Owner'] && params['Owner'].strip != ''
      @foodtrucks = @foodtrucks.where("\"Owner\" like ?", "%#{params['Owner'].strip}%")
    end
    @query = params.nil? ? {Name: '', Type: 'Type (All)', Address: '', Description: '', Owner: ''} : params
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
