require 'rails_helper'

feature 'Admin cadastra nova filial' do
  scenario 'successfully' do
    visit root_path
    click_on 'Filiais'
    click_on 'Registrar nova Filial'

    fill_in 'Nome', with: 'São Mateus'
    fill_in 'CNPJ', with: '123456789'
    fill_in 'Endereço', with: 'Rua de Asfalto'
    click_on 'Enviar'

    expect(page).to have_content('São Mateus')
    expect(page).to have_content('123456789')
    expect(page).to have_content('Rua de Asfalto')
  end
end