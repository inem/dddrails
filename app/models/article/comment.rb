class Article::Comment < ApplicationRecord
  belongs_to :article
  has_many :likes

  MAX_LIKES_PER_HOUR = 5

  state_machine :state, initial: :ok do
    state :ok
    state :deleted

    event :delete do
      transition ok: :deleted
    end
  end

  def can_be_liked?
    likes.within_one_hour.count < MAX_LIKES_PER_HOUR
  end
end
