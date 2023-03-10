class RemoveImageUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column(:products, :image_url)
  end

  def change
    add_column(:products, :url)
  end
end
