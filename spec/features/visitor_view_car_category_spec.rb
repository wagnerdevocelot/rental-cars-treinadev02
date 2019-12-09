require 'rails_helper'

feature 'Visitor view car category' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    CarCategory.create(
        name: 'Picapes', 
        daily_rate: '68.00', 
        car_insurance: '10.00',
        third_party_insurance: '7.00'
    )


    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Picapes'
    

    expect(page).to have_content('Picapes')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    CarCategory.create(
        name: 'Picapes', 
        daily_rate: '68.00', 
        car_insurance: '10.00',
        third_party_insurance: '7.00'
    )

    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Picapes'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
  scenario 'Verifica se tem alguma categoria' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Categorias de Carros'

    

    expect(page).to have_content('Não existem Categorias de carros cadastradas')
  end
end