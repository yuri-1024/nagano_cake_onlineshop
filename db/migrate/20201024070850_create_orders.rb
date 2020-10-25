class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id,   null: false, default: ""
      t.string :postal_code,    null: false, default: ""
      t.string :address,        null: false, default: ""
      t.string :name,           null: false, default: ""
      t.integer :cost,          null: false, default: ""
      t.integer :charge,        null: false, default: ""
      t.boolean :payment,       null: false, default: ""
      t.integer :status         null: false, default: ""

      t.timestamps
    end
  end
end
