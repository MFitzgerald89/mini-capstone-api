class AddColumns < ActiveRecord::Migration[7.0]
  
  def change
    add_column :products, :total, :integer
  end
  
end
