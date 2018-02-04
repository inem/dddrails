class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :links, dependent: :destroy, inverse_of: :article
  has_many :likes, class_name: "Article::Comment::Like"
  accepts_nested_attributes_for :links

  belongs_to :category, required: false
  validates :title, presence: true,
                    length: { minimum: 5 }

  state_machine :state, initial: :draft do
    state :draft
    state :moderation
    state :published

    event :check do
      transition draft: :moderation
    end

    event :publish do
      transition moderation: :published
    end

    event :rollback do
      transition moderation: :draft
    end
  end
end