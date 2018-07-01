class ModerationArticlePhorm < Article
  include ApplicationPhorm

  permit :title, :text, :category_id, :state_event

  validates :category, presence: true
end