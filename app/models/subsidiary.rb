class Subsidiary < ApplicationRecord

    validates :name, :cnpj, :address, presence: true
    validates :name,  :cnpj, :address, uniqueness: true    
end
