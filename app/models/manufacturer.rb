class Manufacturer < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    has_many :car_models
end