require 'rails_helper'

feature 'User edit a expense' do
  scenario 'successfully' do
    create(:expense)

    visit root_path

    click_on 'Editar'

    fill_in 'Data', with: '01/03/2016'
    fill_in 'Descrição', with: 'Consulta médica'
    fill_in 'Valor', with: '220,00'
    check 'Pago'

    click_on 'Salvar'

    expect(page).to have_content('01/03/2016')
    expect(page).to have_content('Consulta médica')
    expect(page).to have_content('R$: 220,00')
    page.assert_selector('td#pay', count: 1)
  end

  scenario 'unsuccessfully' do
    expense = create(:expense)

    visit edit_expense_path(expense)

    fill_in 'Data', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Valor', with: ''

    click_on 'Salvar'

    expect(page).to have_content('Informe uma data')
    expect(page).to have_content('Informe uma descrição')
    expect(page).to have_content('Informe um valor')
  end

  scenario 'select payment' do
    expense = create(:expense)

    visit edit_expense_path(expense)

    check 'Pago'

    click_on 'Salvar'

    page.assert_selector('td#pay')
  end
end
