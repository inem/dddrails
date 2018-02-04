class LikeMutator
  class << self
    def create!(comment, user = nil)
      likes_in_current_hour = Article::Comment::Like.where(created_at: 1.hour.ago..Time.current, comment: comment).count

      if likes_in_current_hour < 5
        @like = comment.likes.build(article: comment.article)
        @like.save!
      end

      Maybe(@like)
    end
  end
end