class Messages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      # 会員への連絡タイトル
      t.string :title, null: false
      # 会員への連絡情報
      t.text :information, null: false
      t.timestamps
    end
  end
end
