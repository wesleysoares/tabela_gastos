require 'rails_helper'

feature 'User delete expenses' do
  scenario 'sucessufuly', js: true do
    expense = create(:expense)

    visit root_path

    click_on 'Excluir'

    within('#expense-modal') do
      click_link('Sim')
    end

    expect(page).to_not have_content expense.description
  end
end
