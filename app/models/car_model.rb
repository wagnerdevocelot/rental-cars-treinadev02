class CarModel < ApplicationRecord
  validates :name, :year, :fuel_type, :manufacturer_id, :motorization, :car_category_id, presence: true
  
  has_many :cars
  
  belongs_to :manufacturer
  belongs_to :car_category

  
end
