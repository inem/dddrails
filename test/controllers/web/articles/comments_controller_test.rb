require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test "should create" do
    params = {commentor: "Vovchik", body: "heyhey"}
    post article_comments_url(@article.id), params: {article_comment: params}

    assert(@article.comments.find_by(params).persisted?)
  end

  test "should destroy" do
    comment = article_comments(:one)
    delete article_comment_url(comment.article.id, comment.id)

    @article = comment.article
    assert { @article.comments.find_by(id: comment.id).nil? }
  end
end
