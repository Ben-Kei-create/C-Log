class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      # 映画へのコメントレビュー
      t.string :comment, null: false
      t.timestamps
    end
  end
end
