class Expense < ActiveRecord::Base
  validates :description, :price, :date, presence: true

  def total_divided
    price / 4
  end

  def total_pay
    total = 0
    Expense.all.each do |expense|
      total += expense.price
    end
    total
  end

  def total_pay_divided
    total = 0
    Expense.all.each do |expense|
      total += expense.price
    end
    total / 4
  end
end
