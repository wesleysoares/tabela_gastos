class Payment < ActiveRecord::Base
  validates_presence_of :date,
                        :description,
                        :value,
                        maximun: 10,
                        message: 'Campo obrigatório'
  validates_length_of :description,
                      maximum: 50,
                      message: 'Tamanho máximo de 50 caracteres'

  def paid?
    paid
  end

  def total_payment
    total = 0
    Payment.all.each do |payment|
      total += payment.value
    end
    total
  end

  def total_paid
    total = 0
    Payment.all.each do |payment|
      total += payment.value if payment.paid?
    end
    total
  end

  def total_not_paid
    total = 0
    Payment.all.each do |payment|
      total += payment.value unless payment.paid?
    end
    total
  end
end
