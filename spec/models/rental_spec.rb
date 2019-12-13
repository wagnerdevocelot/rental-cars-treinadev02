require 'rails_helper'

RSpec.describe Rental, type: :model do
   xdescribe '.end_date_must_be_greater_than_start_date' do
      it 'success' do
         admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

         subsidiary = Subsidiary.create(
            name: 'Sao Paulo', 
            cnpj: '05.370.840/0001-07', 
            address: 'Rua da filial 1'
            ) 

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
            car_category: category,
            subsidiary: subsidiary,
            user: admin
            )



         rental.valid?

         expect(rental.errors).to be_empty
      end

      it 'end date less than start date' do
         admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

         subsidiary = Subsidiary.create(
            name: 'Sao Paulo', 
            cnpj: '05.370.840/0001-07', 
            address: 'Rua da filial 1'
            ) 

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
            start_date: '28/12/2019', 
            end_date: '28/12/1990',
            client: client,
            car_category: category,
            subsidiary: subsidiary,
            user: admin
            )

            rental.valid?

            expect(rental.errors.full_messages).to include(
               'End date deve ser maior que data de inicio'
            )
      end
   end

   xdescribe '.cars_avaiable' do
      
      it 'should be false if subsidiary has no cars' do

         admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

         subsidiary = Subsidiary.create(
            name: 'Sao Paulo', 
            cnpj: '05.370.840/0001-07', 
            address: 'Rua da filial 1'
            ) 

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
            car_category: category,
            subsidiary: subsidiary,
            user: admin
            )


         result = rental.cars_avaiable?


         expect(result).to be false
         

      end

      it 'should be true if subsidiary has no cars' do

         admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

         subsidiary = Subsidiary.create(
            name: 'Sao Paulo', 
            cnpj: '05.370.840/0001-07', 
            address: 'Rua da filial 1'
            ) 

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
            car_category: category,
            subsidiary: subsidiary,
            user: admin
            )


         result = rental.cars_avaiable?


         expect(result).to be true
         

      end

      it 'should be false if subsidiary has no rental scheduled' do


         admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

         subsidiary = Subsidiary.create(
            name: 'Sao Paulo', 
            cnpj: '05.370.840/0001-07', 
            address: 'Rua da filial 1'
            ) 

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


         rental = Rental.create(
            start_date: '28/12/1990', 
            end_date: '28/12/2019',
            client: client,
            car_category: category,
            subsidiary: subsidiary,
            user: admin,
            status: schduled
            )


         other_rental = Rental.new(
            start_date: '28/12/1990', 
            end_date: '28/12/2019',
            client: client,
            car_category: category,
            subsidiary: subsidiary,
            user: admin
            )

         result = rental_cars_avaiale?
         
         expect(result).to be false
         
      end

   end
end
