class AddBudgetIdToDebts < ActiveRecord::Migration
  def change
    add_reference :debts, :budget, index: true, foreign_key: true
  end
end
