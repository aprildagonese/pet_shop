require 'rails_helper'

describe "User visits regions index page" do
  context "as an admin" do
    it "allows admin to see all regions" do
      admin = User.create(name: "Barbara", username: "bsdagonese", password: "phoebe", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_regions_path
      expect(page).to have_content("Admin Regions")
    end
  end

  context "as a default user" do
    it "does not allow me to see admin categories index" do
      user = User.create(username: "fern@gully.com",
                       password: "password",
                       role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit admin_regions_path

      expect(page).to_not have_content("Admin Regions")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
