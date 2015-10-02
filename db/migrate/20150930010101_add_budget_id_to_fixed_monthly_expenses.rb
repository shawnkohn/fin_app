class AddBudgetIdToFixedMonthlyExpenses < ActiveRecord::Migration
  def change
    add_reference :fixed_monthly_expenses, :budget, index: true, foreign_key: true
  end
end
