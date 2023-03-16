class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {minimum: 10}
  validates :description, length: {maximum: 500}


  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  

  
  def is_discounted?
    if price <= 10
      return true
    else
      return false
    end
  end
  
  def tax
    tax = price * 0.09
    return tax
  end
  
  def total
    price + tax
  end
end
