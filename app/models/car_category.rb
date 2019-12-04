class CarCategory < ApplicationRecord

    validates :name, presence: {message: 'Campo Nome não pode ficar em branco'}
    validates :daily_rate, presence: {message: 'Campo Diária não pode ficar em branco'}
    validates :car_insurance, presence: {message: 'Campo Seguro não pode ficar em branco'}
    validates :third_party_insurance, presence: {message: 'Campo  Seguro de terceiros não pode ficar em branco'}

    validates :name, uniqueness: {message: 'Esta Categoria já existe'}
end
