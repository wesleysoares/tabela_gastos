class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|

      t.date :date
      t.string :description
      t.float :value
      t.timestamps null: false
    end
  end
end
