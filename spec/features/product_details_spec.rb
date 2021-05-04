# require 'rails_helper'


# RSpec.feature "users can navigate from the home page to the product detail page by clicking on a product", type: :feature do


#   before :each do
#     @category = Category.create! name: 'Apparel'

#     10.times do |n|
#       @category.products.create!(
#         name:  Faker::Hipster.sentence(3),
#         description: Faker::Hipster.paragraph(4),
#         # image: open_asset('apparel1.jpg'),
#         quantity: 10,
#         price: 64.99
#       )
#     end
#   end

#   scenario "They click on details and see product detail page" do
#     # ACT
#     visit root_path

#     page.first('.product')
#     # DEBUG / VERIFY
#     save_screenshot
    
#   end
# end

require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do


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

  scenario "They see the details of the product" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    page.first('article.product').find('header').click_link
    sleep 1
    save_screenshot
    expect(page).to have_css '.products-show'
  end

end
