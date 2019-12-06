require 'rails_helper'

feature 'Admin delete manufacturer ' do
  scenario 'delete with success' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Manufacturer.create(name: 'FAME')              

    visit root_path
    click_on 'Fabricantes'
    click_on 'FAME'
        
    expect(page).to have_content('FAME')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')      
  end
  scenario 'precisa estar logado' do
    visit new_manufacturer_path

    expect(current_path).to eq new_user_session_path
  end
end