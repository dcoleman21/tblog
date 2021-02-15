require 'rails_helper'

RSpec.describe "Articles show page" do
  it "can go to a specific articles page by id" do
    article1 = Article.create!(title: "My First Article", body: "This is my first article")
    article2 = Article.create!(title: "My Second Article", body: "This is my second article")

    visit "/articles/#{article1.id}"

    expect(page).to have_content("#{article1.title}")
    expect(page).to have_content("#{article1.body}")
    expect(page).to_not have_content("#{article2.title}")
    expect(page).to_not have_content("#{article2.body}")
  end

  it "has a link to update the article" do
    article2 = Article.create!(title: "My Second Article", body: "This is my second article")

    visit "/articles/#{article2.id}"

    expect(page).to have_link("Update Article")
    expect(current_path).to eq("/articles/#{article2.id}")
  end

  it "has a link to delete and article" do
    article2 = Article.create!(title: "My Second Article", body: "This is my second article")

    visit "/articles/#{article2.id}"

    expect(page).to have_link("Delete Article")

    click_link "Delete Article"

    expect(current_path).to eq(articles_path)
    expect(page).to_not have_content("#{article2.title}")
    expect(page).to_not have_content("#{article2.body}")
  end
end
