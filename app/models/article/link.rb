class Article::Link < ApplicationRecord
  belongs_to :article
  validates :url, presence: true
end
