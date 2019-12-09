class Rental < ApplicationRecord
  validates :start_date, :end_date, :client_id, :car_category_id, presence: true

  belongs_to :client
  belongs_to :car_category

  validate :end_date_must_be_greater_than_start_date

  def end_date_must_be_greater_than_start_date
    if end_date < start_date
      errors.add(:end_date, 'deve ser maior que data de inicio')
    end
  end


end
