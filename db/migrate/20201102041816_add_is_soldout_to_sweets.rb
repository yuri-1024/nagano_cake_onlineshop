class AddIsSoldoutToSweets < ActiveRecord::Migration[5.2]
  def change
    add_column :sweets, :is_soldout, :integer, null: false, default: "0"
  end
end
