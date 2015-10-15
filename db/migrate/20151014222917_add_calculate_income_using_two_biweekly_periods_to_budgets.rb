class AddCalculateIncomeUsingTwoBiweeklyPeriodsToBudgets < ActiveRecord::Migration
  def change
    add_column :budgets, :calculate_income_using_two_biweekly_periods, :boolean
  end
end
