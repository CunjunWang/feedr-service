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
        session[:items] = []
        session[:foodtruck][:truck_img] = ""
    end

    def create
        @foodtruck = Foodtruck.new(params.require(:foodtruck).permit(:Name, :Type, :Address, :Description, :Owner))
 
        if @foodtruck.save
            redirect_to @foodtruck
        else
            render 'new'
        end
    end

    def update
        @foodtruck = Foodtruck.find(params[:id])
       
        if @foodtruck.update(params.require(:foodtruck).permit(:Name, :Type, :Address, :Description, :Owner))
          redirect_to @foodtruck
        else
          render 'edit'
        end
    end

    def destroy
        @foodtruck = Foodtruck.find(params[:id])
        @foodtruck.destroy
       
        redirect_to foodtrucks_path
    end
    
end
