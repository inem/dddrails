module Articles
  module Comments
    module Likes
      CreateSchema = Dry::Validation.Schema(BaseSchema) do
        configure do
          config.namespace = :likes
          option :comment

          def limit_exceeded?(limit_per_hour)
            comment.likes.within_one_hour.count < limit_per_hour
          end
        end

        required(:max_likes_per_hour).filled(:limit_exceeded?)
      end
    end
  end
end
