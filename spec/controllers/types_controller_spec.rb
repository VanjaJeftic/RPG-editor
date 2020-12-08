require 'rails_helper'

RSpec.describe TypesController, type: :controller do

  let(:user) { {:email => "test@gmail.com", :username => 'test', :password => 'test11'} }

  let(:type) {
    { :name => "Test name!", :user_id => 1 }
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      @user = FactoryBot.create(:user,
                                email: 'petar1@gmail.com',
                                username: 'petar1',
                                password: 'petar11')

      @type = FactoryBot.create(:type, name: 'Type', user_id: @user.id)
      get :index


      #get :index, types: controller.current_user.types, session: valid_session
      expect(response).to be_successful # be_successful expects a HTTP Status code of 200
      # expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
    end
  end

  describe "POST create" do
    it "create type" do
      type = Type.new()
      @user = FactoryBot.create(:user,
                                email: 'petar1@gmail.com',
                                username: 'petar1',
                                password: 'petar11')

      types_param = FactoryBot.attributes_for(:type,name: 'Type', user_id: @user.id)
      expect { post :create, :type => types_param }.to change(Type, :count).by(1)
    end
  end


  end
