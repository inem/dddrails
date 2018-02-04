class Web::Articles::Comments::LikesController < ApplicationController
  def create
    @comment = Article::Comment.find(params[:comment_id])

    likes_in_current_hour = Article::Comment::Like.where(created_at: 1.hour.ago..Time.now, comment: @comment).count

    if likes_in_current_hour < 5
      @like = @comment.likes.build(article: @comment.article)
      @like.save!
    end

    redirect_to article_path(@comment.article)
  end
end


