class Subsidiary < ApplicationRecord

    has_many :cars
    has_many :rentals

    validates :name, :cnpj, :address, presence: true
    validates :name,  :cnpj, :address, uniqueness: true    
end
