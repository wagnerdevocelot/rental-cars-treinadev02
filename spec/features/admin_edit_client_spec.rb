require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Client.create(
        name: 'Felipe Dilon', 
        cpf: '23423423423', 
        email: 'musadoverao@.com'
    )

    visit root_path
    click_on 'Clientes'
    click_on 'Felipe Dilon'
    click_on 'Editar'
    fill_in 'Nome', with: 'jao'
    fill_in 'CPF', with: '45645645645'
    fill_in 'E-Mail', with: 'jao@.com'
    click_on 'Enviar'

    expect(page).to have_content('jao')
    expect(page).to have_content('45645645645')
    expect(page).to have_content('jao@.com')
    expect(page).to have_content('Cliente editado com sucesso!')
  end
end