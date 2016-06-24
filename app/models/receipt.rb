class Receipt < ActiveRecord::Base
  validates_presence_of :date,
                        :description,
                        :value,
                        message: "Campo obrigatório"
  validates_length_of :description,
                      maximum: 50,
                      message: "Tamanho máximo de 50 caracteres"

  def total_receipt
    total = 0
    Receipt.all.each do |receipt|
      total += receipt.value
    end
    total
  end

  def paid?
    paid
  end

  def total_paid
    total = 0
    Receipt.all.each do |receipt|
      total += receipt.value if receipt.paid?
    end
    total
  end

  def total_not_paid
    total = 0
    Receipt.all.each do |receipt|
      total += receipt.value unless receipt.paid?
    end
    total
  end
end
