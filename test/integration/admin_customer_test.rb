require 'test_helper'

class AdminCustomerTest < ActionDispatch::IntegrationTest

  def test_add_customer
    visit "/admin/customers"
    click_on "Add new customer", match: :first
    fill_in "Name", with: "Example User"
    fill_in "Email", with: "user@example.com"
    fill_in "Zip code", with: "12345"
    fill_in "State", with: "FL"
    click_on "Create Customer"
    assert page.has_content?("Customer Example User was created!")
    click_on "Example User"
    click_on "Edit customer"
    fill_in "Name", with: "Example User2"
    fill_in "Email", with: "user2@example.com"
    fill_in "Zip code", with: "12345"
    fill_in "State", with: "FL"
    click_on "Update Customer"
    assert page.has_content?("Customer Example User2 was updated Successfully!")  
    click_on "User2"
    click_on "Delete customer"
    visit "/admin/customers"
    refute page.has_content?("User2")

    
  end
  
end