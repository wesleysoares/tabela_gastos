require 'rails_helper'

feature 'User see total payments' do
  scenario 'successfully' do
    create(:payment)
    create(:payment, value: 100)
    create(:payment, paid: true, value: 350)
    create(:payment, paid: true, value: 50)

    visit payment_path

    expect(page).to have_content('R$: 101,50')
    expect(page).to have_content('R$: 400,00')
    expect(page).to have_content('R$: 501,50')
  end
end
