class Article::Category < ApplicationRecord
  has_many :articles

  def initialize(attrs = {})
    defaults = {
      title: "Not set"
    }
    super(defaults.merge(attrs))
  end
end
