class Rental < ApplicationRecord
  validates :start_date, :end_date, :client_id, :car_category_id presence: true

  belongs_to :client
  belongs_to :car_category
end
