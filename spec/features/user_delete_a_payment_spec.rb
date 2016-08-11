require 'rails_helper'

feature 'User delete a payment' do
  scenario 'successfully', js: true do
    payment = create(:payment)

    visit payment_path

    find('a.btn.btn-danger.glyphicon.glyphicon-trash').click

    within('#payment-modal') do
      click_on('Sim')
    end

    expect(page).to_not have_content payment.description
  end
end
