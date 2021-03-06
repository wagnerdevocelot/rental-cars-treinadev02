require 'rails_helper'

feature 'Visitor view clients' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Client.create(
      name: 'jao', 
      cpf: '45645645645',
      email: 'jao@mail'
    )

    visit root_path
    click_on 'Clientes'
    click_on 'jao'
    

    expect(page).to have_content('jao')
    expect(page).to have_content('45645645645')
    expect(page).to have_content('jao@mail')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Client.create(
        name: 'jao', 
        cpf: '45645645645',
        email: 'jao@mail'
      )

    visit root_path
    click_on 'Clientes'
    click_on 'jao'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
  scenario 'Verifica se tem algum cliente' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Clientes'

    

    expect(page).to have_content('Não existem clientes cadastrados')
  end
end