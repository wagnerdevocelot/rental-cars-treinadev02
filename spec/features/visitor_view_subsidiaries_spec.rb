require 'rails_helper'

feature 'Visitor view subsidiaries' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Subsidiary.create(
      name: 'Sao Paulo', 
      cnpj: '55.110.650/0001-09',
      address: 'Alameda Santos'
    )

    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
    

    expect(page).to have_content('Sao Paulo')
    expect(page).to have_content('55.110.650/0001-09')
    expect(page).to have_content('Alameda Santos')
    expect(page).to have_link('Voltar')
  end

  scenario 'and return to home page' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Subsidiary.create(
      name: 'Sao Paulo', 
      cnpj: '55.110.650/0001-09',
      address: 'Alameda Santos'
    )

    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
    click_on 'Voltar'
    

    expect(current_path).to eq root_path
  end
  scenario 'Verifica se tem alguma filial' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)

    visit root_path
    click_on 'Filiais'

    

    expect(page).to have_content('Não existem Filiais cadastradas')
  end
end