class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image, null: false, default: ""
      t.string :name, null: false, default: ""
      t.text :info, null: false, default: ""
      t.integer :category_id, null: false
      t.integer :sales_status_id, null: false
      t.integer :shipping_fee_status_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :schedule_delivery_id, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
