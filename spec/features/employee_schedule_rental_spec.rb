require 'rails_helper'

feature 'Admin cadastra nova filial' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

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

    visit root_path
    click_on 'Agendar Locação'
    click_on 'Novo Agendamento'

    fill_in 'Data Inicial', with: '28/12/1990'
    fill_in 'Data Final', with: '28/12/2019'
    select category.name, from: 'Categoria'
    select client.name, from: 'Cliente'
    click_on 'Enviar'


    expect(page).to have_content('28/12/1990')
    expect(page).to have_content('28/12/2019')
    expect(page).to have_content(category.name)
    expect(page).to have_content(client.name)



  end

end