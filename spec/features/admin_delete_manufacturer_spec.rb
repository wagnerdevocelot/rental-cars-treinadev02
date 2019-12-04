require 'rails_helper'

feature 'Admin delete manufacturer ' do
  scenario 'delete with success' do
    Manufacturer.create(name: 'FAME')              

    visit root_path
    click_on 'Fabricantes'
    click_on 'FAME'
        
    expect(page).to have_content('FAME')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Deletar')      
  end
end