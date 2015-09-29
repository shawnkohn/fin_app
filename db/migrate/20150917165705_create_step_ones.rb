class CreateStepOnes < ActiveRecord::Migration
  def change
    create_table :step_ones do |t|
      t.money :goal_balance
      t.money :current_balance

      t.timestamps null: false
    end
  end
end
