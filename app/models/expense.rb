class Expense < ActiveRecord::Base
  validates :description, :price, :date, presence: true

  def total_divided
    price / 4
  end
end
