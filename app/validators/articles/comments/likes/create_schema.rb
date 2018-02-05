module Articles
  module Comments
    module Likes
      #CreateSchema = Dry::Validation.Schema(BaseSchema) do
      #  configure do
      #    config.namespace = :likes
      #    option :comment
      #
      #    def can_be_liked?
      #      comment.can_be_liked?
      #    end
      #  end
      #
      #  required(:comment).filled(:can_be_liked?)
      #end
    end
  end
end
