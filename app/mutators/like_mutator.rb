class LikeMutator
  class << self
    def create!(comment)
      comment.likes.build(article: comment.article).save!
    end

    def validate(comment)
      comment.can_be_liked?
    end
  end
end