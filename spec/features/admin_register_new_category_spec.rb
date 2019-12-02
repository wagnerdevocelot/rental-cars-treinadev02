require 'rails_helper'

feature 'Admin cadastra nova categoria' do
  scenario 'successfully' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Registrar nova Categoria de carro'

    fill_in 'Nome', with: 'SUV'
    fill_in 'Diária', with: '98'
    fill_in 'Seguro', with: '39'
    fill_in 'Seguro de terceiros', with: '14'
    click_on 'Enviar'
    click_on 'SUV'

    expect(page).to have_content('SUV')
    expect(page).to have_content('98')
    expect(page).to have_content('39')
    expect(page).to have_content('14')
  end
end