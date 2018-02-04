class CreateArticleCommentLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :article_comment_likes do |t|
      t.references :comment
      t.references :article
      t.integer :user_id
      t.timestamps
    end
  end
end
