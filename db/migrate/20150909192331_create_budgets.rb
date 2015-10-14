class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.decimal :monthly_financial_goal_amount, :precision => 12, :scale => 2, :default => 0

      t.timestamps null: false
    end
  end
end
