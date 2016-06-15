require 'rails_helper'

feature 'User delete a receipt' do
  scenario 'sucessufuly' do
    receipt = create(:receipt)

    visit receipt_path

    click_on 'Excluir'

    expect(page).to_not have_content receipt.description
  end
end
