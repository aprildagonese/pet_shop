require 'rails_helper'

describe 'As a visitor' do
  context "when I visit Pets#index" do
    it 'allows the visitor to create an account' do
      visit root_path

      click_on "Create An Account"

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: "April Dagonese"
      fill_in :user_username, with: "adagonese"
      fill_in :user_password, with: "mypassword"

      click_on "Create User"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Your account has been created, April Dagonese!")
      expect(page).to have_link("Log Out")
    end
  end
end

require 'rails_helper'

describe "As a registered user" do
  context "when I visit Pets#index and I click on 'Log In'" do
    it 'shows login form' do
      user = User.create!(name: "Fae", username: "faedag", password: "faepassword")

      visit root_path

      click_on "Log In"

      expect(current_path).to eq(login_path)
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password

      click_button "Log In"

      expect(current_path).to eq(root_path)

      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_link("Log In")
    end
  end
end
