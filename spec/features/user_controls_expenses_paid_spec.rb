require 'rails_helper'

feature 'User controls expenses paid' do
  scenario 'successfully' do
    expense = create(:expense, paid: true)

    visit edit_expense_path(expense)

    check('Pago')

    click_on 'Salvar'

    expect(page).to have_css('glyphicon glyphicon-thumbs-up')
  end
end
