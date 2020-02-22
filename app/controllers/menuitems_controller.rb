class MenuitemsController < ApplicationController
    def edit
        @foodtruck = Foodtruck.find(params[:foodtruck_id])
        @menuitem = @foodtruck.menuitems.find(params[:id])
    end

    def create
        @foodtruck = Foodtruck.find(params[:foodtruck_id])
        @menuitem = @foodtruck.menuitems.create(menuitem_params)
        redirect_to foodtruck_path(@foodtruck)
    end

    def destroy
        @foodtruck = Foodtruck.find(params[:foodtruck_id])
        @menuitem = @foodtruck.menuitems.find(params[:id])
        @menuitem.destroy
        redirect_to foodtruck_path(@foodtruck)
    end

    def update
        @foodtruck = Foodtruck.find(params[:foodtruck_id])
        @menuitem = @foodtruck.menuitems.find(params[:id])
        @menuitem_params.update(menuitem_params)
    end

    private
        def menuitem_params
            params.require(:menuitem).permit(:Name, :Description, :price)
        end
end
