class Garden < ApplicationRecord
  has_many :plants

  def self.order_by_date
    order(created_at: :desc).to_a
  end

  def count_of_plants
    plants.size
  end

  def sort_plants
    require 'pry'; binding.pry
    plants.order(:name)
  end
end