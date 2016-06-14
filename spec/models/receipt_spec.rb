require 'rails_helper'

RSpec.describe Receipt do
  it do
    is_expected.to validate_presence_of(:date).with_message('Campo obrigatório')
  end
  it do
    is_expected.to validate_presence_of(:description)
      .with_message('Campo obrigatório')
  end
  it do
    is_expected.to validate_presence_of(:value)
      .with_message('Campo obrigatório')
  end
  it do
    should validate_length_of(:description).is_at_most(50)
      .with_message('Tamanho máximo de 50 caracteres')
  end

  it 'total_receipt' do
    receipt1 =  create(:receipt)
    receipt2 =  create(:receipt, value: '100,00')
    expect(receipt1.total_receipt).to eq(receipt1.value + receipt2.value)
  end
end
