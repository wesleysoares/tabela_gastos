require 'rails_helper'

feature 'User edit a receipt' do
  scenario 'successfully' do

    create(:receipt)

    visit root_path

    click_on 'Recebimentos'

    click_on 'Editar'

    fill_in 'Data', with: '08/05/2016'
    fill_in 'Descrição', with: 'Descrição Editada'
    fill_in 'Valor', with: '300,00'

    click_on 'Salvar'

    expect(page).to have_content('08/05/2016')
    expect(page).to have_content('Descrição Editada')
    expect(page).to have_content('R$: 300,00')

  end

  scenario 'unsuccessfully' do

    create(:receipt)

    visit receipt_path

    click_on 'Editar'

    fill_in 'Data', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Valor', with: ''

    click_on 'Salvar'

    expect(page). to have_content('Informe uma data')
    expect(page).to have_content('Informe uma descrição')
    expect(page).to have_content('Informe um valor')

  end

end
