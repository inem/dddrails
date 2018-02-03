class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category, required: false
  validates :title, presence: true,
                    length: { minimum: 5 }

  state_machine :state, initial: :draft do
    state :draft
    state :moderation
    state :published

    event :check do
      transition [:draft] => :moderation
    end

    event :publish do
      transition [:moderation] => :published
    end
  end
end