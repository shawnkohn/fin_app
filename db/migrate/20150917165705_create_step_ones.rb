class CreateStepOnes < ActiveRecord::Migration
  def change
    create_table :step_ones do |t|
      t.decimal :goal_balance
      t.decimal :current_balance

      t.timestamps null: false
    end
  end
end
