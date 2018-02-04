class Article::Comment < ApplicationRecord
  belongs_to :article
  has_many :likes

  state_machine :state, initial: :regular do
    state :deleted

    event :delete do
      transition draft: :deleted
    end
  end
end
