class CarCategory < ApplicationRecord

    validates :name, :daily_rate, :car_insurance, :third_party_insurance, presence: true
    validates :name, uniqueness:true

    has_many :car_models
    has_many :rentals
end
