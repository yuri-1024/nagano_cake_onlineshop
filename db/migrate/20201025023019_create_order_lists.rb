class CreateOrderLists < ActiveRecord::Migration[5.2]
  def change
    create_table :order_lists do |t|
      t.integer :sweet_id,         null: false
      t.integer :order_id,         null: false
      t.integer :price,            null: false
      t.integer :amount,           null: false
      t.integer :creat_status,     null: false, default: "0"

      t.timestamps
    end
  end
end
