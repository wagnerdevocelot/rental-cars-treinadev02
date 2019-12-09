require 'rails_helper'

feature 'Admin edits category' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    CarCategory.create(
        name: 'Picapes', 
        daily_rate: 68.00, 
        car_insurance: 10.00,
        third_party_insurance: 7.00
    )

    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Picapes'
    click_on 'Editar'
    fill_in 'Nome', with: 'Luxuosos'
    fill_in 'Diária', with: 44
    fill_in 'Seguro', with: 44
    fill_in 'Seguro de terceiros', with: 44
    click_on 'Enviar'

    expect(page).to have_content('Luxuosos')
    expect(page).to have_content('44')
    expect(page).to have_content('44')
    expect(page).to have_content('44')
    expect(page).to have_content('Categoria editada com sucesso!')
  end
end