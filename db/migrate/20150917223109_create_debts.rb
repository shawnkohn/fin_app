class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :name
      t.decimal :balance
      t.decimal :minimum_monthly_payment
      t.decimal :interest_rate

      t.timestamps null: false
    end
  end
end
