class Rental < ApplicationRecord
  belongs_to :client
  belongs_to :car_category
  belongs_to :subsidiary
  belongs_to :user

  validates :start_date, :end_date, :client_id, :car_category_id, :subsidiary, :user, presence: true



  validate :end_date_must_be_greater_than_start_date

  def end_date_must_be_greater_than_start_date
    
    if end_date < start_date
      errors.add(:end_date, 'deve ser maior que a Data de Inicio')
    end
  end
end
