class LikeMutator
  class << self
    MAX_LIKES_PER_HOUR = 5

    def create!(comment)
      comment.likes.build(article: comment.article).save
    end

    def validate(comment)
      #schema = Dry::Validation.Schema do
      #  required(:email).filled(:str?)
      #  required(:age).filled(:int?, gt?: 18)
      #end

      Articles::Comments::Likes::CreateSchema.
        with(comment: comment).
        call(max_likes_per_hour: MAX_LIKES_PER_HOUR)
    end
  end
end