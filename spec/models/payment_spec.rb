require 'rails_helper'

RSpec.describe Payment, type: :model do
  it do
    should validate_presence_of(:date).with_message('Campo obrigatório')
  end
  it do
    should validate_presence_of(:description).with_message('Campo obrigatório')
  end
  it do
    should validate_presence_of(:value).with_message('Campo obrigatório')
  end
  it do
    should validate_length_of(:description).is_at_most(50)
      .with_long_message('Tamanho máximo de 50 caracteres')
  end

  it 'total_payment' do
    payment = create(:payment)
    payment1 = create(:payment, value: 100)
    expect(payment.total_payment).to eq(payment.value + payment1.value)
  end

  it 'total_paid' do
    payment = create(:payment)
    payment1 = create(:payment, value: 100, paid: true)
    expect(payment.total_paid).to eq(payment1.value)
  end

  it 'total_not_paid' do
    payment = create(:payment, paid: true)
    payment1 = create(:payment, value: 150)
    expect(payment.total_not_paid).to eq(payment1.value)
  end
end
