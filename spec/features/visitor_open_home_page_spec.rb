require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    visit root_path

    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locação')
  end
end