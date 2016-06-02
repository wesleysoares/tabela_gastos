class Receipt < ActiveRecord::Base
  validates :date, :description, :value, presence: true

  def total_receipt
    total = 0
    Receipt.all.each do |receipt|
      total += receipt.value
    end
    total
  end
end
