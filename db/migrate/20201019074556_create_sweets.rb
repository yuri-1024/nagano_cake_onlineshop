class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.string :name,         null: false
      t.text :introduction,   null: false
      t.integer :price,       null: false
      t.boolean :is_soldout,  null: false, default: "false"
      t.integer :genre_id,    null: false
      t.string :image_id,     null: false

      t.timestamps
    end
  end
end
