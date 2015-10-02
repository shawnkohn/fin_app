class AddBudgetIdToStepOne < ActiveRecord::Migration
  def change
    add_reference :step_ones, :budget, index: true, foreign_key: true
  end
end
