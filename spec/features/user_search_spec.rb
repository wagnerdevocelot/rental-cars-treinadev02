require 'rails_helper'

feature 'user search rental' do
    xscenario 'sucessfully' do
        user = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

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
            client: client, 
            car_category: category, 
            start_date: 1.day.from_now, 
            end_date: 2.days.from_now,
            reservation_code: 'ABC1234'
            )

        rental = Rental.create(
            client: client, 
            car_category: category, 
            start_date: 1.day.from_now, 
            end_date: 2.days.from_now,
            reservation_code: 'AAA1234'
            )

        login_as(user, scope: :user)


        visit root_path
        click_on 'Agendar Locação'
        fill_in 'Código', with: rental.reservation_code
        click_on 'Buscar'

        expect(page).to have_content(rental.reservation_code)
        expect(page).not_to have_content(other_rental.reservation_code)


    end
end