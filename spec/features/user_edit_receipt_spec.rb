require 'rails_helper'

feature 'User edit a receipt' do
  scenario 'successfully' do
    create(:receipt)

    visit receipt_path

    click_on 'Recebimentos'

    find('a.btn.btn-default.glyphicon.glyphicon-edit').click

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

    find('a.btn.btn-default.glyphicon.glyphicon-edit').click

    fill_in 'Data', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Valor', with: ''

    click_on 'Salvar'

    expect(page). to have_content('Campo obrigatório', count: 3)
  end

  scenario 'maximum size description' do
    visit new_receipt_path

    fill_in 'Data', with: '13/06/2016'
    fill_in 'Descrição', with: 'Lorem ipsum dolor sit amet, has ut nulla
                                adversarium voluptatibus. Pri ne delectus
                                antiopam inciderint, pro cu harum iriure
                                conclusionemque.'
    fill_in 'Valor', with: '150,00'

    click_on 'Salvar'

    expect(page).to have_content('Tamanho máximo de 50 caracteres')
  end
end
