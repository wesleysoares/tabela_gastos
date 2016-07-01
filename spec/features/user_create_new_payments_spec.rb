require 'rails_helper'

feature 'User create a new payments' do
  scenario 'successfully' do
    visit root_path

    click_on 'Pagamentos'

    click_on 'Adicionar novo pagamento'

    fill_in 'Data', with: '28/06/2016'
    fill_in 'Descrição', with: 'Novo pagamento'
    fill_in 'Valor', with: '100,00'

    click_on 'Salvar'

    expect(page).to have_content('28/06/2016')
    expect(page).to have_content('Novo pagamento')
    expect(page).to have_content('R$: 100,00')
  end
  scenario 'unsuccessfully' do
    visit new_payment_path

    click_on 'Salvar'

    expect(page).to have_content('Campo obrigatório', count: 3)
  end
  scenario 'cancel' do
    visit new_payment_path

    click_on 'Cancelar'

    expect(current_path).to eq payment_path
  end
end
