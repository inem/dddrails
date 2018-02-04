require 'test_helper'

class Web::Articles::Comments::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = article_comments(:one)
    @article = @comment.article
  end

  test "should create" do
    likes_count = Article::Comment::Like.count

    params = {article_id: @article.id, comment_id: @comment.id}
    post article_comment_likes_url(@comment,@article), params: {article_comment_like: params}

    assert { Article::Comment::Like.count == likes_count + 1 }
  end
end
