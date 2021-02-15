require 'rails_helper'

RSpec.describe 'article index page' do
  it "sees a link to create a new article" do
    visit root_path

    expect(page).to have_link("Create a New Article")
  end
  it "is taken to a form to create a new article" do
    visit root_path

    click_link "Create a New Article"

    expect(current_path).to eq('/articles/new')

    title = 'My Third Article'
    body = 'This is my third article'

    fill_in :title, with: title
    fill_in :body, with: body

    click_on "Create a New Article"

    expect(current_path).to eq(articles_path)
    expect(page).to have_content('My Third Article')
    expect(page).to have_content('This is my third article')
  end
end
