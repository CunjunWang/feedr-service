class FoodtrucksController < ApplicationController
  def new
    @foodtruck = Foodtruck.new
  end

  def index
    @foodtrucks = Foodtruck.all
  end

  def edit
    @foodtruck = Foodtruck.find(params[:id])
  end


  def show
    @foodtruck = Foodtruck.find(params[:id])
    session[:foodtruck] = {}
    session[:foodtruck][:truck_id] = @foodtruck.id
    session[:foodtruck][:truck_name] = @foodtruck.Name
    if session[:item].nil? || session[:item].empty?
      session[:items] = []
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

    if @foodtruck.update(params.require(:foodtruck).permit(:Name, :Type, :Address, :Description, :Owner))
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    @foodtruck = Foodtruck.find(params[:id])
    @foodtruck.destroy
    redirect_to user_path
  end

end
