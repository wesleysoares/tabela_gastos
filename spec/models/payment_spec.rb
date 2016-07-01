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
end
