require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    
    let(:my_user) { User.create!(email: "jayaramraja1987@gmail.com", password: "123456", password_confirmation: "123456") }
    let(:my_item) { Item.create!(name: "jayaramraja1987", user: my_user) }
    
    before :each do
        sign_in my_user
    end
    
    describe "POST create" do
        it "increases the number of items by 1" do
            expect{ post :create, id: my_item.id, item: {name: "Arsenal"} }.to change(Item,:count).by(1)
        end

        it "assigns the new item to @item" do
            post :create, id: my_item.id, item: {name: "Arsenal"}
            expect(assigns(:item)).to eq Item.last
        end

        it "redirects to the user #show view" do
            post :create, id: my_item.id, item: {name: "Arsenal"}
            expect(response).to redirect_to [my_user]
        end
  end

end
