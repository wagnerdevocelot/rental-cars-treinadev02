require 'rails_helper'

RSpec.describe Rental, type: :model do
   describe '.end_date_must_be_greater_than_start_date' do
      it 'success' do
         category = CarCategory.create(
            name: 'Perua', 
            daily_rate: 68.00, 
            car_insurance: 10.00,
            third_party_insurance: 7.00
        )  
    
        client = Client.create(
            name: 'Felipe Dilon', 
            cpf: '23423423423', 
            email: 'musadoverao@.com'
        )


         rental = Rental.new(
            start_date: '28/12/1990', 
            end_date: '28/12/2019',
            client: client,
            car_category: category
            )



         rental.valid?

         expect(rental.errors).to be_empty
      end

      it 'end date less than start date' do
         rental = Rental.new(
            start_date: '28/12/2019', 
            end_date: '28/12/1990'
            )

            rental.valid?

            expect(rental.errors.full_messages).to include(
               'End date deve ser maior que data de inicio'
            )
      end
   end
end
