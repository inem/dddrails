class CreateArticleLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :article_links do |t|

      t.timestamps
    end
  end
end
