require 'test_helper'

class CreateSubscriptionTest < ActionDispatch::IntegrationTest

def test_create_subscription
  visit "subscriptions/new"
  save_and_open_page
  fill_in "Email", with: 'test@example.com'
  click_on "Sign up"
  assert page.has_content?('Subscription was successfully created.')
  assert_equal 'test@example.com', Subscription.last.email
end

end