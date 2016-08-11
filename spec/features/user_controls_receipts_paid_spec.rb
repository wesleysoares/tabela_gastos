require 'rails_helper'

feature 'User controls receipts paid' do
  scenario 'edit receipt and check paid' do
    create(:receipt)
    create(:receipt, description: 'Teste', paid: true)

    visit receipt_path

    find('a.btn.btn-default.glyphicon.glyphicon-edit', match: :first).click

    check 'Pago'

    click_on 'Salvar'

    expect(page).to have_css('span.glyphicon.glyphicon-check', count: 2)
  end

  scenario 'create receipt and check paid' do
    visit receipt_path

    click_on 'Adicionar novo recebimento'

    fill_in 'Data', with: '16/06/2016'
    fill_in 'Descrição', with: 'Teste de recebimento'
    fill_in 'Valor', with: '140,00'

    check 'Pago'

    click_on 'Salvar'

    expect(page).to have_content('Teste de recebimento')
    expect(page).to have_css('span.glyphicon.glyphicon-check')
  end

  scenario 'uncheck paid' do
    create(:receipt, paid: true)
    create(:receipt, paid: true)

    visit receipt_path

    find('a.btn.btn-default.glyphicon.glyphicon-edit', match: :first).click

    uncheck 'Pago'

    click_on 'Salvar'

    expect(page).to have_css('span.glyphicon.glyphicon-check', count: 1)
  end
end
