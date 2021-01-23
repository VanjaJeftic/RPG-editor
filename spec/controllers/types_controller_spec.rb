require 'rails_helper'

RSpec.describe TypesController, type: :controller do
  let(:user) { { email: 'test@gmail.com', username: 'test', password: 'test11' } }

  let(:type) do
    { name: 'Test name!', user_id: 1 }
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      @user = FactoryBot.create(:user,
                                email: 'petar1@gmail.com',
                                username: 'petar1',
                                password: 'petar11')

      @type = FactoryBot.create(:type, name: 'Type', user_id: @user.id)
      @types = Type.all
      expect(response).to be_successful
    end
  end

  describe 'POST create' do
    it 'create type' do
      @user = FactoryBot.create(:user,
                                email: 'petar1@gmail.com',
                                username: 'petar1',
                                password: 'petar11')

      types_param = FactoryBot.attributes_for(:type, name: 'Type', user_id: @user.id)
      @type = Type.new(types_param)
      @type.save
      expect(response.status).to eq(200)
    end
  end
end
