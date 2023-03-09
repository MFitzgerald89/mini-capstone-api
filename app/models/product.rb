class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: {greater_than: 0}
  validates :price, numericality: {only_integer: true}
  validates :description, length: {minimum: 10}
  validates :description, length: {maximum: 500}

  def supplier
    Supplier.find_by(:id => supplier_id)
  end
end
