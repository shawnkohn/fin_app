class CreateStepOnes < ActiveRecord::Migration
  def change
    create_table :step_ones do |t|
      t.decimal :goal_balance, :precision => 12, :scale => 2
      t.decimal :current_balance, :precision => 12, :scale => 2
      t.references :budget, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
