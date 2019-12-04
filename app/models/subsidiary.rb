class Subsidiary < ApplicationRecord

    validates :name, presence: {message: 'Campo Nome não pode ficar em branco'}
    validates :cnpj, presence: {message: 'Campo CNPJ não pode ficar em branco'}
    validates :address, presence: {message: 'Campo Endereço não pode ficar em branco'}
    validates :name, uniqueness: {message: 'Filial já cadastrada'}
    validates :cnpj, uniqueness: {message: 'CNPJ já cadastrado'}
    validates :address, uniqueness: {message: 'Endereço já cadastrado'}
    validates :cnpj, length: { minimum: 18, message: 'O campo CNPJ deve conter 18 caracteres' }
end
