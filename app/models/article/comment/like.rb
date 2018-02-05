class Article::Comment::Like < ApplicationRecord
  belongs_to :comment
  belongs_to :article

  scope :within_one_hour, -> { where('created_at > ?', 1.hour.ago) }
end
