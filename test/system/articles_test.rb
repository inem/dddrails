require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit articles_url

    assert_selector "h1", text: "Articles"
  end

  test "visiting new article" do
    visit new_article_url
    assert_selector "h1", text: "New article"
  end
end
