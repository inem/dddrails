require 'test_helper'

class Web::ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_category = article_categories(:main)
    @secondary_category = article_categories(:secondary)
  end

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
    # TODO: Use factory to build article
    post articles_url(params: {article: { title: "Supertitle", text: "Body", category_id: @main_category.id }})

    new_article = Article.find_by(title: "Supertitle")
    assert { new_article&.persisted? }
    assert { new_article.state == 'draft' }
    assert { new_article.text == 'Body' }
    assert { new_article.category_id == @main_category.id }
  end

  test "should post update" do
    @article = articles(:one)
    patch article_url(@article.id), params: {article: { title: "Supertitle", text: "Body", category_id: @secondary_category.id}}

    @article.reload

    assert { @article.title == "Supertitle" }
    assert { @article.state == 'draft' }
    assert { @article.category_id == @secondary_category.id }
  end

  test "should send to moderation" do
    @article = articles(:one)

    patch moderate_article_url(@article.id)

    assert { @article.reload.state == 'moderation' }
  end

  test "should destroy" do
    @article = articles(:one)
    delete article_url(@article.id)

    assert(Article.find_by(title: "Supertitle").nil?)
  end
end
