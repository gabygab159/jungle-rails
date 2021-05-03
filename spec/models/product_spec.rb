require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
 
    it "should have all 4 fields set" do
      @category = Category.new
      @category.id = 20
      @category.name = "products"
      @product = Product.new
      @product.name = "sofa"
      @product.price = 2000
      @product.quantity = 50
      @product.category_id = @category
      @category.products = [@product]
      @product.save
      expect(@product).to be_valid
      
    end

    it 'should have a name' do
      @category = Category.new
      @category.id = 20
      @category.name = "products"
      @product = Product.new
      @product.name = nil
      @product.price = 2000
      @product.quantity = 50
      @product.category_id = @category
      @category.products = [@product]
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages.length).to eql(1)
      expect(@product.errors.full_messages[0]).to eql("Name can't be blank")
      puts @product.errors.full_messages
    end   

    it 'should have a price' do
      @category = Category.new
      @category.id = 20
      @category.name = "products"
      @product = Product.new
      @product.name = "chair"
      @product.price = nil
      @product.quantity = 50
      @product.category_id = @category
      @category.products = [@product]
      @product.save
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eql("Price cents is not a number")
      

    end   


    it 'should have a quantity' do
      @category = Category.new
      @category.id = 20
      @category.name = "products"
      @product = Product.new
      @product.name = "chair"
      @product.price = 123000
      @product.quantity = nil
      @product.category_id = @category
      @category.products = [@product]
      @product.save      
      
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eql("Quantity can't be blank")
      puts @product.errors.full_messages
    end   

    it 'should have a category' do
      @category = nil     
      @product = Product.new
      @product.name = "chair"
      @product.price = 123000
      @product.quantity = 20
      @product.category_id = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eql("Category can't be blank")
      puts @product.errors.full_messages
    end   
  end
end
