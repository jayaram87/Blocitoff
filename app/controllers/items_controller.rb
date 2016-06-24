class ItemsController < ApplicationController

    def create
        @item = Item.new
        @item.name = params[:item][:name]
        @item.user = current_user
        
        if @item.save
            flash[:notice] = "Item created"
            redirect_to @item.user
        end
    end
    
    def destroy
        
        @item = Item.find(params[:id])
        @item.user = current_user
       
        if @item.destroy
            flash[:notice] = "#{@item.name} was deleted successfully."
            redirect_to @item.user     
        end
        
        respond_to do |format|
            format.html
            format.js
        end
    end
    
end
