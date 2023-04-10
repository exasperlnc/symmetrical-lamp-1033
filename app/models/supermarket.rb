class Supermarket < ApplicationRecord
  has_many :items
  def self.customers_distinct(supermarket_id)
    joins(items: :customers).where("supermarket_id = #{supermarket_id}").pluck("customers.name").uniq
  end
end