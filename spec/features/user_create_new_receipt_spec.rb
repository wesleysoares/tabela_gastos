require 'rails_helper'

feature 'User create a new receipt' do
  scenario 'successfully' do
    visit root_path

    click_on 'Recebimentos'

    click_on 'Adicionar novo recebimento'

    fill_in 'Data', with: '01/06/2016'
    fill_in 'Descrição', with: 'Novo recebimento'
    fill_in 'Valor', with: '150,00'

    click_on 'Salvar'

    expect(page).to have_content('01/06/2016')
    expect(page).to have_content('Novo recebimento')
    expect(page).to have_content('R$: 150,00')
  end

  scenario 'unsuccessfully' do
    visit new_receipt_path

    click_on 'Salvar'

    expect(page).to have_content('Informe uma data')
    expect(page).to have_content('Informe uma descrição')
    expect(page).to have_content('Informe um valor')
  end

  scenario 'value total' do
    receipt1 = create(:receipt)
    receipt2 = create(:receipt, description: 'Novo recebimento 2', value: '100,00')

    visit receipt_path

    expect(page).to have_content('R$: 225,00')
  end
end
