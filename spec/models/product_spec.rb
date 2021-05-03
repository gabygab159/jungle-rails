require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @product = Product.new
      expect(@product.name).to be_present
    end   
  end
end
