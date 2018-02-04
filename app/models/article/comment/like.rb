class Article::Comment::Like < ApplicationRecord
  belongs_to :comment
  belongs_to :article

  # Так низя. Атата! Потомушто лайку низя знать про другие лайки

  # validate :no_more_than_five_likes

  # def no_more_than_five_likes
  #   count = Article::Comment::Like.where(created_at: 1.hour.ago..Time.current, comment: @comment).count

  #   if likes_in_current_hour > 5
  #     errors.add_to_base("Too many likes per hour!!!")
  #   end
  # end
end
