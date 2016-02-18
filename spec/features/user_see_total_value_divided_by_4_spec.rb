require 'rails_helper'

feature 'User see total value divided by 4' do
  scenario 'successfully' do
    create(:expense)

    visit root_path

    expect(page).to have_content('30,00')
  end
end
