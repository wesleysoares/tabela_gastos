require 'rails_helper'

feature 'User delete a payment' do
  scenario 'successfully', js: true do
    payment = create(:payment)

    visit payment_path

    click_on 'Excluir'

    within('#payment-modal') do
      click_on('Sim')
    end

    expect(page).to_not have_content payment.description
  end
end
