require 'rails_helper'

feature 'User create a new expense' do
  scenario 'successfully' do
    visit root_path

    click_on 'Novo Gasto'

    fill_in 'Data', with: '01/02/2016'
    fill_in 'Descrição', with: 'Passagem de avião'
    fill_in 'Valor', with: '200,00'

    click_on 'Salvar'

    expect(page).to have_content('Passagem de avião')
    expect(page).to have_content('200,00')
    expect(page).to have_content('01/02/2016')
  end

  scenario 'unsuccessfully' do
    visit root_path

    click_on 'Novo Gasto'
    click_on 'Salvar'

    expect(page).to have_content('Informe uma data')
    expect(page).to have_content('Informe uma descrição')
    expect(page).to have_content('Informe um valor')
  end
end
