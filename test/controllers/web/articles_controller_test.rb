require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get show" do
    get article_url(articles(:one).id)
    assert_response :success
  end

  test "should get new" do
    get new_article_url(articles(:one).id)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(articles(:one).id)
    assert_response :success
  end

  test "should post create" do
    post articles_url(params: {article: { title: "Supertitle", text: "Body"}})

    new_article = Article.find_by(title: "Supertitle")
    assert(new_article&.persisted?)
  end

  test "should post update" do
    @article = articles(:one)
    patch article_url(@article.id, params: {article: { title: "Supertitle", text: "Body"}})

    assert(@article.reload.title, "Supertitle")
  end

  test "should destroy" do
    @article = articles(:one)
    delete article_url(@article.id)

    assert(Article.find_by(title: "Supertitle").nil?)
  end
end
