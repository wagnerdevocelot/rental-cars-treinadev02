class Subsidiary < ApplicationRecord

    validates :name, :cnpj, :address, presence: true
    validates :name,  :cnpj, :address, uniqueness: true
    validates :cnpj, length: { minimum: 18 }
end
