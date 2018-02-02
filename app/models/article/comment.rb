class Article::Comment < ApplicationRecord
  self.table_name = "comments"
  belongs_to :article
end
