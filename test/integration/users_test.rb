require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.reset_session!
  end

  test "user name is displayed after logging" do
    log_in
    assert has_content? 'Steve Jobs'
    assert has_no_link? 'Log in'
  end

  test "user name is not displayed before logging" do
    visit '/parkings'
    assert has_link? 'Log in'
    assert has_no_content? 'Steve Jobs'
  end

  test "user logs out" do
    log_in
    assert has_content? 'Logged in as Steve Jobs.'
    click_link 'Log out'
    assert has_content? 'Logged out!'
    assert has_link? 'Log in'
    assert has_no_content? 'Steve Jobs'
  end

  test "user logs in directly from main page" do
    log_in
    assert has_content? 'Parkings'
  end

  test "user logs in after redirection from cars" do
    visit '/cars'
    assert has_content? 'You must be logged in to access this section.'
    click_link 'Log in'
    fill_in 'email', with: 'steve@jobs.com'
    fill_in 'password', with: 'secret123'
    click_button 'Log in'
    assert has_content? 'Your registered cars'
    assert has_content? 'Maluch'
  end

  test "user logs in after redirection from place_rents" do
    visit '/place_rents'
    assert has_content? 'You must be logged in to access this section.'
    click_link 'Log in'
    fill_in 'email', with: 'steve@jobs.com'
    fill_in 'password', with: 'secret123'
    click_button 'Log in'
    assert has_content? 'Listing rents'
  end
end
