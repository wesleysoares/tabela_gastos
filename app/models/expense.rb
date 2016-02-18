class Expense < ActiveRecord::Base
  validates :description, :price, :date, presence: true
end
