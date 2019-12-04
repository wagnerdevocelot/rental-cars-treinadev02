require 'rails_helper'


feature 'admin register car model' do
    scenario 'successufuly' do
        Manufacturer.create(name: 'Chevrolet')
        CarCategory.create(
            name: 'Hatch', 
            daily_rate: '68.00', 
            car_insurance: '10.00',
            third_party_insurance: '7.00'
        )


        visit root_path
        click_on 'Modelos de Carros'
        click_on 'Registrar novo modelo'

        fill_in 'Nome', with: "Onix"
        fill_in 'Ano', with: "2020"
        fill_in 'Motorização', with: "1.0"
        fill_in 'Combustivel', with: "Flex"
        select 'Chevrolet', from: 'Fabricantes'
        select 'Hatch', from: 'Categorias'

        click_on 'Enviar'


        expect(page).to have_content('Modelo cadastrado com sucesso!')
        expect(page).to have_content('Onix')
        expect(page).to have_content('Ano: 2020')
        expect(page).to have_content('1.0')
        expect(page).to have_content('Flex')
        expect(page).to have_content('Fabricante: Chevrolet')
        expect(page).to have_content('Categoria: Hatch')
    end
end