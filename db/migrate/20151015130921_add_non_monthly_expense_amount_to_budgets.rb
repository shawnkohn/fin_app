class AddNonMonthlyExpenseAmountToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :non_monthly_expense_amount, :decimal, precision:12, scale:2, default:0.0
  end
end
