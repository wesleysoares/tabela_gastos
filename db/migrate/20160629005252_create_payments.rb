class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.date :date
      t.string :description
      t.float :value

      t.timestamps null: false
    end
  end
end
