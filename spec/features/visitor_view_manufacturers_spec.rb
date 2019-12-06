require 'rails_helper'

feature 'Visitor view manufacturers' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).to have_content('Fiat')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Manufacturer.create(name: 'Fiat')
    Manufacturer.create(name: 'Volkswagen')

    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
  scenario 'Verifica se tem alguma fabricante' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Fabricantes'

    

    expect(page).to have_content('Não existem fabricantes cadastrados')
  end
  scenario 'precisa estar logado' do
    visit new_manufacturer_path

    expect(current_path).to eq new_user_session_path
  end
end