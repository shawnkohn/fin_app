class CreateFixedMonthlyExpenses < ActiveRecord::Migration
  def change
    create_table :fixed_monthly_expenses do |t|
      t.string :expense
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
