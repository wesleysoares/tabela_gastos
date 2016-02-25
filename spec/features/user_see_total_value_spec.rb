require 'rails_helper'

feature 'User see total value in home' do
  scenario 'successfully' do
    create(:expense)
    create(:expense, description: 'Gasto 2')

    visit root_path

    expect(page).to have_content('240,00')
  end
end
