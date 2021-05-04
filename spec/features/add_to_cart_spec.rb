require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
    scenario "They click on 'add to cart' and count will increase from 0 to 1" do
      visit root_path
      expect(page).to have_text 'My Cart (0)'
      save_screenshot
      page.find('.product', match: :first).find('.actions').click_on 'Add'      
      save_screenshot
      expect(page).to have_text 'My Cart (1)'
    end
  
end
