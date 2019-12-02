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

    expect(page).to have_content('Você deve preencher todos os campos')
  end

end