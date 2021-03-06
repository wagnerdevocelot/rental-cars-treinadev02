require 'rails_helper'

feature 'Admin delete client ' do
  scenario 'delete with success' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Client.create(
        name: 'Bruno', 
        cpf: '12343245676', 
        email: 'wagner@.com'
    )            

    visit root_path
    click_on 'Clientes'
    click_on 'Bruno'
        
    expect(page).to have_content('Bruno')
    expect(page).to have_content(12343245676)
    expect(page).to have_content('wagner@.com')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')      
  end
end