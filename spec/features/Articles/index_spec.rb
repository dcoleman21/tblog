require 'rails_helper'

RSpec.describe "As a visitor" do
  it "the welcome page displays a welcome message and form to create a new article" do
    visit root_path
    expect(page).to have_content("Your Articles")
    expect(page).to have_content("Create a New Article")
  end
end
