class AddStickyToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :sticky, :boolean
  end
end
