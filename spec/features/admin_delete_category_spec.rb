require 'rails_helper'

feature 'Admin delete category ' do
  scenario 'delete with success' do
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