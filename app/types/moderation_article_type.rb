class ModerationArticleType < Article
  include ApplicationType

  permit :title, :text, :category_id, :state_event

  validates :category_id, presence: true
end