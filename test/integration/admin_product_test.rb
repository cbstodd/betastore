require 'test_helper'

class AdminProductTest < ActionDispatch::IntegrationTest

  def test_add_product
    visit "/admin/products"
    click_on "Add product", match: :first
    
    fill_in "Name", with: "Item"
    fill_in "Price", with: "9.99"
    fill_in "Image url", with: "www.image.com"
    click_on "Create Product"
    assert page.has_content?('Product Item was created!')
    click_on "Item"
    click_on "Edit Product"
    fill_in "Name", with: "Item2"
    fill_in "Price", with: "1234.99"
    fill_in "Image url", with: "www.image.com"
    click_on "Update Product"
    assert page.has_content?("Product Item2 was updated Successfully!")
    click_on "Item2"
    click_on "Delete product"
    visit "/admin/products"
    refute page.has_content?("Item2")

  end



end