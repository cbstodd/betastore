require 'test_helper'

class ViewProductsTest < ActionDispatch::IntegrationTest

  def test_view_products
    visit "/"
    assert page.has_content?("Hat")
    click_link "Hat"
    assert page.has_content?("Great top hat")


    
  end
  
end