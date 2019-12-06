require 'rails_helper'

feature 'Admin logins' do
    scenario 'successfully' do
        user = User.create!(email: 'wagner@mail', password: '12345678')


        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Log in'


        expect(current_path).to eq(root_path)
        expect(page).to have_content('Signed in successfully')
        expect(page).to have_link('Sair')
        expect(page).not_to have_link('Entrar')
    end

    scenario 'successfully' do
        user = User.create!(email: 'wagner@mail', password: '12345678')


        visit root_path
        click_on 'Entrar'
        fill_in 'Email', with: user.email
        fill_in 'Senha', with: user.password
        click_on 'Log in'
        click_on 'Sair'


        expect(current_path).to eq(root_path)
        expect(page).to have_content('Signed out successfully')
        expect(page).to have_link('Entrar')
        expect(page).not_to have_link('Sair')
    end
end
