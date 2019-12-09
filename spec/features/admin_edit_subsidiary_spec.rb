require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    admin = User.create!(email: 'wagner@mail', password: '12345678', role: :admin)

    login_as(admin, scope: :user)
    Subsidiary.create(name: 'Sao Paulo', cnpj: '05.370.840/0001-07', address: 'Rua da filial 1')

    visit root_path
    click_on 'Filiais'
    click_on 'Sao Paulo'
    click_on 'Editar'
    fill_in 'Nome', with: 'Macapá'
    fill_in 'CNPJ', with: '05.370.111/4444-07'
    fill_in 'Endereço', with: 'Rua gonzaguinha fodase'
    click_on 'Enviar'

    expect(page).to have_content('Macapá')
    expect(page).to have_content('05.370.111/4444-07')
    expect(page).to have_content('Rua gonzaguinha fodase')
    expect(page).to have_content('Filial editada com sucesso!')
  end
end