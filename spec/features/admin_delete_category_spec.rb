require 'rails_helper'

feature 'Admin delete category ' do
  scenario 'delete with success' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    CarCategory.create(
        name: 'Perua', 
        daily_rate: 68.00, 
        car_insurance: 10.00,
        third_party_insurance: 7.00
    )            

    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Perua'
        
    expect(page).to have_content('Perua')
    expect(page).to have_content(68.00)
    expect(page).to have_content(10.00)
    expect(page).to have_content(7.00)
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')      
  end
end