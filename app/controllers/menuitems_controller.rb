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

    def add
        found = 0
        @foodtruck = Foodtruck.find_by(params[:foodtruck_id])
        @menuitem = @foodtruck.menuitems.find(params[:menuitem_id])
        
        session[:items].each do |item|
            if @menuitem.id.to_s == item[:item_id].to_s
                item[:quantity] += 1
                found = 1
            end
        end
        if found == 0
            new_item = {}
            new_item[:item_id] = @menuitem.id
            new_item[:item_name] = @menuitem.Name
            new_item[:item_price] = @menuitem.price
            new_item[:item_img] = ""
            new_item[:quantity] = 1
            session[:items].push(new_item)
        end
        redirect_to  "/foodtrucks/#{params[:foodtruck_id]}"
    end
    
    def remove
        @foodtruck = Foodtruck.find_by(params[:foodtruck_id])
        @menuitem = @foodtruck.menuitems.find(params[:menuitem_id])
        session[:items].each do |item|
            if @menuitem.id.to_s == item[:id].to_s
                item[:quantity] -= 1
                if item[:quantity] == 0
                    session[:items].delete(item)
                end
            end
        end
        redirect_to  "/foodtrucks/#{params[:foodtruck_id]}"
    end

    private
        def menuitem_params
            params.require(:menuitem).permit(:Name, :Description, :price)
        end
end
