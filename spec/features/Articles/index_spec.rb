require 'rails_helper'

RSpec.describe "Articles index page" do
  it "the articles page displays a list of articles and a form to create a new article" do
    article1 = Article.create!(title: "My First Article", body: "This is my first article")
    article2 = Article.create!(title: "My Second Article", body: "This is my second article")

    visit root_path

    expect(page).to have_content('Your Articles')
    expect(page).to have_content(article1.title)
    expect(page).to have_content(article1.body)
    expect(page).to have_link("Create a New Article")
  end
end
