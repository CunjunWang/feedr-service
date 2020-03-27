class FoodtrucksController < ApplicationController
  def new
    @foodtruck = Foodtruck.new
  end

  def index
    @foodtrucks = if !logged_in?
                    Foodtruck.all
                  else
                    Foodtruck.where('user_id != ?', current_user.id)
                  end
  end

  def edit
    @foodtruck = Foodtruck.find(params[:id])
    @foodtruck.cover.attach(params[:cover])
    @menuitem_errors = []
  end


  def show
    id = params[:id]
    @foodtruck = Foodtruck.find(id)

    key = "#{current_user.id}_#{id}"
    cart = $redis.get key
    @cart = ((cart.nil? || cart == '') ? {} : eval(cart))

    session[:foodtruck] = {}
    session[:foodtruck][:truck_id] = @foodtruck.id
    session[:foodtruck][:truck_name] = @foodtruck.Name
    if session[:item].nil? || session[:item].empty?
      session[:items] = Hash.new
    end
    session[:foodtruck][:truck_img] = ""
  end


  def create
    @foodtruck = Foodtruck.new(params.require(:foodtruck).permit(:Name, :Type, :Address, :Description, :Owner, :user_id))
    if @foodtruck.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  def update
    @foodtruck = Foodtruck.find(params[:id])

    if @foodtruck.update(params.require(:foodtruck).permit(:Name, :Type, :Address, :Description, :Owner, :cover))
      redirect_to @foodtruck
    else
      render 'edit'
    end
  end

  def destroy
    @foodtruck = Foodtruck.find(params[:id])
    @foodtruck.destroy
    redirect_to user_path
  end

  def toggle
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @foodtruck.is_open = !@foodtruck.is_open
    @foodtruck.save
    redirect_to '/users/show'
  end
end
