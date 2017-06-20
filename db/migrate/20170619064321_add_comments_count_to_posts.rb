class AddCommentsCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :comments_count, :bigint, default: 0
  end
end
