require 'rails_helper'

describe 'Registering user' do
  it 'shows a form' do
    visit root_path
    save_and_open_page
    click_on "Create An Account"

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: "test"

    click_on "Create Account"

    expect(page).to have_content("Welcome, #{username}!")
  end
end
