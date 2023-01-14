class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      # 管理者からの情報
      t.text :information, null: false
      t.timestamps
    end
  end
end
