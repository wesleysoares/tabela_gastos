require 'rails_helper'

RSpec.describe Receipt do
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:value) }

  it 'total_receipt' do
    receipt1 =  create(:receipt)
    receipt2 =  create(:receipt, value: '100,00')
    expect(receipt1.total_receipt).to eq(receipt1.value + receipt2.value)
  end
end
