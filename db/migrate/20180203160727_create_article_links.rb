class CreateArticleLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :article_links do |t|
      t.string :url
      t.references :article
      t.timestamps
    end
  end
end
