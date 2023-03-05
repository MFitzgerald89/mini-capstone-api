class ChangeProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :description, :text

    change_column :products, :price, :integer, precision: 9, scale: 2
    add_column :products, :inventory, :integer
  end
end
