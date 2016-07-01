class Payment < ActiveRecord::Base
  validates_presence_of :date,
                        :description,
                        :value,
                        maximun: 10,
                        message: 'Campo obrigatório'
  validates_length_of :description,
                      maximum: 50,
                      message: 'Tamanho máximo de 50 caracteres'
end
