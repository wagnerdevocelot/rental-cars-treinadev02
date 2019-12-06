class Car < ApplicationRecord
  validates :license_plate, :color, :mileage, :car_model_id, :subsidiary, presence: true
  validates :license_plate, uniqueness: true

  belongs_to :car_model
  belongs_to :subsidiary
end
