class ItemsController < ApplicationController

    def new
        @item = Item.new
        @item.user = current_user
    end
    
    def create
        @item = Item.new
        @item.name = params[:item][:name]
        @item.user = current_user
        
        if @item.save
            flash[:notice] = "Item created"
            redirect_to @item.user
        else
            flash.now[:alert] = "There was an error saving the item. Please try again."
            render :new
        end
        
    end
    
end
