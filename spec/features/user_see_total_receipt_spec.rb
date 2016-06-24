require 'rails_helper'

feature 'User see total_value' do
  scenario 'sucessufuly' do
    create(:receipt)
    create(:receipt, value: '100,00', paid: true)

    visit receipt_path

    expect(page).to have_content('R$: 100,00')
    expect(page).to have_content('R$: 125,00')
    expect(page).to have_content('R$: 225,00')
  end
end
