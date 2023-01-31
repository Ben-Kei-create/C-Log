class AddMovieIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :movie_id, :integer
  end
end
