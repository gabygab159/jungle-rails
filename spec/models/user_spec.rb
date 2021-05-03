require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validtations' do  
    it "should have a password field that matches password confirmation" do
      @user = User.create(name:'Bob', 
        email: "bob@email.com",
        password: "test",
        password_confirmation:"wrongpassword")
      expect(@user.password).not_to eql(@user.password_confirmation)
    end
    # it "should have a name" do
    #   @user = User.new(name: nil, 
    #     email: "bob@email.com",
    #     password: "test",
    #     password_confirmation:"test")
    #   expect(@user).to_not be_valid      
    # end
    # it "should have an email present" do
    #   @user = User.new
    #   @user.name = "Bob"
    #   @user.email = nil
    #   @user.password = "test"
    #   @user.password_confirmation = "test"
    #   expect(@user).to_not be_valid 
      
    # end

  end
end
