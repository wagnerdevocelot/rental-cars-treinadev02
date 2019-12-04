require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'successfully' do
    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Fiat')
  end

  scenario 'and must fill all fields' do
    visit new_manufacturer_path
    fill_in 'Nome', with: ""
    click_on 'Enviar'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'name must be unique' do
    Manufacturer.create!(name: 'FIAT')

    visit new_manufacturer_path
    fill_in 'Nome', with: "FIAT"
    click_on 'Enviar'

    expect(page).to have_content('Name has already been taken')
  end
end

# dois testes de editar

