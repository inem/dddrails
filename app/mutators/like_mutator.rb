class LikeMutator
  class << self
    def create!(comment)
      like = comment.likes.build(article: comment.article)
      like.save!
      like
    end

    def validate(comment)
      comment.can_be_liked?
    end
  end
end