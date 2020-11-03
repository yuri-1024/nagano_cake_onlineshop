class RemoveIsSoldoutFromSweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :sweets, :is_soldout, :boolean
  end
end
