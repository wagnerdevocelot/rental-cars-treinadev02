require 'rails_helper'

feature 'Admin edits manufacturer' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Manufacturer.create(name: 'Fiat')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Editar'
    fill_in 'Nome', with: 'Honda'
    click_on 'Enviar'

    expect(page).to have_content('Honda')
    expect(page).to have_content('Fabricante editado com sucesso!')
  end
  scenario 'precisa estar logado' do
    visit new_manufacturer_path

    expect(current_path).to eq new_user_session_path
  end
end