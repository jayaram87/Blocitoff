require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    let(:my_user) { User.create!(email: "jayaramraja1987@gmail.com", password: "123456", password_confirmation: "123456", confirmed_at: Time.now) }
    
    before :each do
        sign_in my_user
    end
    
    describe "GET show" do
        it "returns http success" do
            get :show, id: my_user.id
            expect(response).to have_http_status(:success)
        end
        
        it "renders the #show view" do
            get :show, id: my_user.id
            expect(response).to render_template :show
        end
        
        it "assigns my_user to @user" do
            get :show, id: my_user.id
            expect(assigns(:user)).to eq(my_user)
        end
        
    end
end
