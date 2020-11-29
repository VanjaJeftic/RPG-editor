require 'rails_helper'

RSpec.describe Attribute, type: :model do

  before(:each) do
    @user = User.create(email: 'test@gmail.com',
                        username: 'test',
                        password: 'test11')

    @type = Type.create(name: 'Type', user_id: @user.id)
    @type.image.attach(io: File.open("#{Rails.root}/app/assets/images/hunter.jpeg"), filename: "hunter.jpeg")
    @type.save()

    @attribute = Attribute.create(name: 'Attribute', numerical: 100, type_id: @type.id)
    @attribute.icon.attach(io: File.open("#{Rails.root}/app/assets/images/speed.png"), filename: "speed.png")
    @attribute.save()
  end

  it 'is valid' do
    expect(@attribute).to be_valid
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

  it "is attached" do
    @attribute.icon.attach(
        io: File.open(("#{Rails.root}/app/assets/images/hunter.jpeg"), filename: "hunter.jpeg"),
        filename: 'hunter.jpeg'
    )
    expect(@attribute.icon).to be_attached
  end

  it "is not valid without a name" do
    @attribute.name = nil
    expect(@attribute).to_not be_valid
  end

  it "is not valid without a numerical" do
    @attribute.numerical = nil
    expect(@attribute).to_not be_valid
  end

end
