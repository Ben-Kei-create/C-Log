class RemoveBestMovieFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :best_movie, :string
    remove_column :customers, :remommend_movie, :string
  end
end
