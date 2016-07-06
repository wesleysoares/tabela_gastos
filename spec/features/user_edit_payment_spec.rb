require 'rails_helper'

feature 'User edit a payment' do
  scenario 'successfully' do
    create(:payment)

    visit payment_path

    click_on 'Editar'

    fill_in 'Data', with: '10/07/2016'
    fill_in 'Descrição', with: 'Nova descrição'
    fill_in 'Valor', with: '200,00'

    click_on 'Salvar'

    expect(page).to have_content '10/07/2016'
    expect(page).to have_content 'Nova descrição'
    expect(page).to have_content 'R$: 200,00'
  end

  scenario 'unsuccessfully' do
    create(:payment)

    visit payment_path

    click_on 'Editar'

    fill_in 'Data', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Valor', with: ''

    click_on 'Salvar'

    expect(page).to have_content('Campo obrigatório', count: 3)
  end
end
