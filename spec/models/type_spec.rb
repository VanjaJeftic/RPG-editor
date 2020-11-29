require 'rails_helper'

RSpec.describe Type, type: :model do

  before(:each) do
    @user = User.create(email: 'test@gmail.com',
                        username: 'test',
                        password: 'test11')

    @type = Type.create(name: 'Test', user_id: @user.id)
    @type.image.attach(io: File.open("#{Rails.root}/app/assets/images/hunter.jpeg"), filename: "hunter.jpeg")
    @type.save()
  end

  it 'is valid' do
    expect(@type).to be_valid
  end

  it 'db should have column name' do
    should have_db_column(:name).of_type(:string)
  end

  it 'db should have column user_id' do
    should have_db_column(:user_id).of_type(:integer)
  end

  it "is attached" do
    @type.image.attach(
        io: File.open(("#{Rails.root}/app/assets/images/hunter.jpeg"), filename: "hunter.jpeg"),
        filename: 'hunter.jpeg'
    )
    expect(@type.image).to be_attached
  end

  it "is not valid without a title" do

  end
  it "is not valid without a description"

end
