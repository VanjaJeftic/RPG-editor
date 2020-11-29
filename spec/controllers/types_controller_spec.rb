require 'rails_helper'

RSpec.describe TypesController, type: :controller do

  before(:all) do
    @user = User.create(username: "john", email: "john@gmail.com", password: "john11")
    @type = Type.create(name: 'Test', user_id: @user.id)
    @type.image.attach(io: File.open("#{Rails.root}/app/assets/images/hunter.jpeg"), filename: "hunter.jpeg")
    @type.save()
  end

  describe "GET index" do
    it "returns a 200" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

 




end
