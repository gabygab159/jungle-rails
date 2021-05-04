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

    it "ensures password is not an empty field" do
      @user = User.create(name: "bob",
        email: "bob@email.com",
        password: nil,
        password_confirmation: "test")
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
      
    end

    it "should have a password that is at least 4 characters" do
      @user = User.create(name: "bob",
        email: "bob@email.com",
        password: "cat",
        password_confirmation: "cat")
      expect(@user).to_not be_valid
      puts @user.errors.full_messages
      
    end

    it "should have a name" do
      @user = User.create(id: 1,
        name: nil, 
        email: 'bob@email.com',
        password: 'test',
        password_confirmation:'test')
        expect(@user).to_not be_valid      
        puts @user.errors.full_messages   
    end

    it "should have an email present" do
      @user = User.create(id: 1,
        name: 'Bob', 
        email: nil,
        password: 'test',
        password_confirmation:'test')
      expect(@user).to_not be_valid    
      puts @user.errors.full_messages        
    end

    it "should have a unique email that is not case sensitive" do
      @user = User.create(id: 1,
        name: 'Bob', 
        email: 'bob@email.com',
        password: 'test',
        password_confirmation:'test')
      @user2 = User.create(id: 2,
        name: 'Bob', 
        email: 'BOB@email.com',
        password: 'test',
        password_confirmation:'test')
      expect(@user2).to_not be_valid 
      puts @user.errors.full_messages      
    end
  end
  
  describe '.authenticate_with_credentials' do
    it "should authenticate if email is given in different case and has white space " do
      @user = User.create(id: 1,
        name: 'Bob', 
        email: 'bob@email.com',
        password: 'test',
        password_confirmation:'test')
      @authenticated = User.authenticate_with_credentials('  BOb@eMAil.com', 'test')
      expect(@user).to eql(@authenticated)
    end
  end
end

