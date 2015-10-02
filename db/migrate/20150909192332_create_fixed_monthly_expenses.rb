class CreateFixedMonthlyExpenses < ActiveRecord::Migration
  def change
    create_table :fixed_monthly_expenses do |t|
      t.string :name
      t.decimal :amount, :precision => 12, :scale => 2
      t.references :budget, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
