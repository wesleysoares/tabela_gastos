class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :description
      t.float :price
      t.date :date
      t.timestamps null: false
    end
  end
end
