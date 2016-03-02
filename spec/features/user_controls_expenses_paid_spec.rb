require 'rails_helper'

feature 'User controls expenses paid' do
  scenario 'successfully' do
    create(:expense, description: 'Passagem', paid: true)
    expense = create(:expense)

    visit edit_expense_path(expense)

    check('Pago')

    click_on 'Salvar'

    page.assert_selector('td#pay', count: 2)
  end

  scenario 'not expect paid' do
    expense = create(:expense)

    visit edit_expense_path(expense)

    page.assert_selector('td#pay', count: 0)
  end
end
