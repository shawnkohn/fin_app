class AddUseBiweeklyExtraForNonMonthlyExpensesToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :use_biweekly_extra_for_non_monthly_expenses, :boolean
  end
end
