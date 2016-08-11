require 'rails_helper'

feature 'User delete a receipt' do
  scenario 'sucessufuly', js: true do
    receipt = create(:receipt)

    visit receipt_path

    find('a.btn.btn-danger.glyphicon.glyphicon-trash').click

    within('#receipt-modal') do
      click_link('Sim')
    end

    expect(page).to_not have_content receipt.description
  end
end
