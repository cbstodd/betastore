require 'test_helper'

class ViewProductsTest < ActionDispatch::IntegrationTest

  def test_view_products
    visit "/"

    click_link "Hat"
    assert page.has_content?("1,234.56")
    assert page.has_content?("Great top hat")
    click_on "Add to cart"
    assert page.has_content?("Shopping Cart")
    assert page.has_content?("1,234.56")
    click_link "Hat"
    click_on "Add to cart"
    assert page.has_content("2469.12")


    
  end
  
end