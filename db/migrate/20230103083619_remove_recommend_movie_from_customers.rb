class RemoveRecommendMovieFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :recommend_movie, :string
  end
end
