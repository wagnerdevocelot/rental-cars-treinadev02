class Subsidiary < ApplicationRecord

    has_many :cars


    validates :name, :cnpj, :address, presence: true
    validates :name,  :cnpj, :address, uniqueness: true    
end
