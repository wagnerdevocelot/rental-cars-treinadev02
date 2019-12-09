require 'rails_helper'

feature 'Admin register manufacturer' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Fabricantes'
    click_on 'Registrar novo fabricante'

    fill_in 'Nome', with: 'Fiat'
    click_on 'Enviar'

    expect(page).to have_content('Fiat')
  end

  scenario 'and must fill all fields' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

    visit new_manufacturer_path
    fill_in 'Nome', with: ""
    click_on 'Enviar'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'name must be unique' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

    Manufacturer.create!(name: 'FIAT')

    visit new_manufacturer_path
    fill_in 'Nome', with: "FIAT"
    click_on 'Enviar'

    expect(page).to have_content('Name has already been taken')
  end

  scenario 'precisa estar logado' do
    visit new_manufacturer_path

    expect(current_path).to eq new_user_session_path
  end  
end


