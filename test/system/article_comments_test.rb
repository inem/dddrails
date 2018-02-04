require "application_system_test_case"

class ArticleCommentsTest < ApplicationSystemTestCase

  test "create new comment" do
    visit article_url(articles(:one))

    assert_selector "p", text: "MyString"

    # fill_in 'Commentor', with: 'Vasya'
    # fill_in 'Body', with: 'byl zdyes'
    # click_button 'Create Comment'

    # assert_selector "p", text: "Vasya"
    # assert_selector "p", text: "byl zdyes"

    # assert(page.current_url, article_url(articles(:one)))
  end
end
