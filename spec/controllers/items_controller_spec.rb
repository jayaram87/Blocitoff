require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    
    let(:my_user) { User.create!(email: "jayaramraja1987@gmail.com", password: "123456", password_confirmation: "123456", confirmed_at: Time.now) }
    let(:my_item) { Item.create!(name: "jayaramraja1987", user: my_user) }
    
    before :each do
        sign_in my_user
    end
    
    describe "POST create" do
        it "increases the number of items by 1" do
            expect{ post :create, user_id: my_user.id, item: {name: "Arsenal"} }.to change(Item,:count).by(1)
        end

        it "assigns the new item to @item" do
            post :create, user_id: my_user.id, item: {name: "Arsenal"}
            expect(assigns(:item)).to eq Item.last
        end

        it "redirects to the user #show view" do
            post :create, user_id: my_user.id, item: {name: "Arsenal"}
            expect(response).to redirect_to [my_user]
        end
    end
  
    describe "DELETE destroy" do
        it "deletes the item" do
            delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
            count = Item.where({id: my_item.id}).size
            expect(count).to eq 0
        end

        it "redirects to users show" do
            delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
            expect(response).to have_http_status(:success)   
        end
    end
end
