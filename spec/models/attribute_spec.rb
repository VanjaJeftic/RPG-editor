require 'rails_helper'

RSpec.describe Attribute, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user,
                              email: 'petar1@gmail.com',
                        username: 'petar1',
                        password: 'petar11')

    @type = FactoryBot.create(:type, name: 'Type', user_id: @user.id)
  end

  subject do
    described_class.new(id:1, type_id: @type.id, user_id: @user.id, numerical: 1, name: 'attribute1')
  end

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'db should have column name' do
    should have_db_column(:name).of_type(:string)
  end

  it 'db should have column type_id' do
    should have_db_column(:type_id).of_type(:integer)
  end

  it 'db should have column numerical' do
    should have_db_column(:numerical).of_type(:integer)
  end

  it 'is attached' do
    subject.icon.attach(
      io: File.open("#{Rails.root}/app/assets/images/hunter.jpeg", filename: 'hunter.jpeg'),
      filename: 'hunter.jpeg'
    )
    expect(subject.icon).to be_attached
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a numerical' do
    subject.numerical = nil
    expect(subject).to_not be_valid
  end
end
