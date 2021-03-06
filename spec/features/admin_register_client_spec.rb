require 'rails_helper'

feature 'Admin register client' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Registrar novo Cliente'

    fill_in 'Nome', with: 'jesus'
    fill_in 'CPF', with: '56756756756'
    fill_in 'E-Mail', with: 'jesus@mail'
    click_on 'Enviar'

    expect(page).to have_content('jesus')
    expect(page).to have_content('56756756756')
    expect(page).to have_content('jesus@mail')
  end

  scenario 'and must fill all fields' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    visit new_client_path
    fill_in 'Nome', with: ""
    click_on 'Enviar'

    expect(page).to have_content("Name can't be blank")
  end

  scenario 'name must be unique' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Client.create!(name: 'FIAT', cpf: '56756756756', email: 'jesus@mail')

    visit new_client_path
    fill_in 'Nome', with: ""
    fill_in 'CPF', with: ""
    fill_in 'E-Mail', with: ""
    click_on 'Enviar'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Cpf can't be blank")
    expect(page).to have_content("Email can't be blank")
  end
end