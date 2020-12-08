require 'rails_helper'

RSpec.describe Type, type: :model do
  before(:each) do
    @user = FactoryBot.create(
    :user,
                        email: 'petar@gmail.com',
                        username: 'petar',
                        password: 'petar1')
  end

  subject do
    described_class.new(id: 1, user_id: @user.id, name: 'type1')
  end

  it {should belong_to(:user)}

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'db should have column name' do
    should have_db_column(:name).of_type(:string)
  end

  it 'db should have column user_id' do
    should have_db_column(:user_id).of_type(:integer)
  end

  it 'is attached' do
    subject.image.attach(
      io: File.open("#{Rails.root}/app/assets/images/hunter.jpeg", filename: 'hunter.jpeg'),
      filename: 'hunter.jpeg'
    )
    expect(subject.image).to be_attached
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
