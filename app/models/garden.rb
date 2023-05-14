class Garden < ApplicationRecord
  has_many :plants

  def self.order_by_date
    order(created_at: :desc).to_a
  end

end