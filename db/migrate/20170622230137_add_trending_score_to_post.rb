class AddTrendingScoreToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :trending_score, :float
  end
end
