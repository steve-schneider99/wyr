require 'rails_helper'

describe "creating a new user " do
  it "will add a new user" do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'user@user.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

describe "logging in" do
  it "Will log in a user" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end

describe 'logging out' do
  it 'will log out a user' do
    user = FactoryGirl.create(:user)
    login(user)
    click_link 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end
end

describe 'edit user profile' do
  it "will go to the current users profile" do
    user = FactoryGirl.create(:user)
    login(user)
    click_link 'Edit profile'
    fill_in 'Email', with: "woot@woot.com"
    fill_in 'Current password', with: 'password'
    click_on "Update"
    expect(page).to have_content "Your account has been updated successfully"
  end
end
