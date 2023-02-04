class CreateWatches < ActiveRecord::Migration[6.1]
  def change
    create_table :watches do |t|
      t.integer :customer_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
