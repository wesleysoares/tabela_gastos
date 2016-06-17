class AddPaidToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :paid, :boolean
  end
end
