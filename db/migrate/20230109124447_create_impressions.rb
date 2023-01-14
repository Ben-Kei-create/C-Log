class CreateImpressions < ActiveRecord::Migration[6.1]
  def change
    create_table :impressions do |t|
      t.integer :customer_id, null: false
      # 私の一番好きな映画
      t.string :best_movie, null: false
      # 私のオススメする映画
      t.string :recommend_movie, null: false
      t.timestamps
    end
  end
end
