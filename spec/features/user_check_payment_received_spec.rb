require 'rails_helper'

feature 'User check payment received' do
  scenario 'edit payment and check paid' do
    create(:payment)
    create(:payment, paid: true)

    visit payment_path

    find('a.btn.btn-default.glyphicon.glyphicon-edit', match: :first).click

    check('Pago')

    click_on 'Salvar'

    expect(page).to have_css('span.glyphicon.glyphicon-check', count: 2)
  end

  scenario 'create payment and check paid' do
    visit payment_path

    click_on 'Adicionar novo pagamento'

    fill_in 'Data', with: '09/08/2016'
    fill_in 'Descrição', with: 'Teste pagamento'
    check 'Pago'
    fill_in 'Valor', with: '150,00'

    click_on 'Salvar'

    expect(page).to have_css('span.glyphicon.glyphicon-check', count: 1)
  end

  scenario 'uncheck paid' do
    create(:payment, paid: true)
    create(:payment, paid: true)

    visit payment_path

    find('a.btn.btn-default.glyphicon.glyphicon-edit', match: :first).click

    uncheck('Pago')

    click_on 'Salvar'

    expect(page).to have_css('span.glyphicon.glyphicon-check', count: 1)
  end
end
