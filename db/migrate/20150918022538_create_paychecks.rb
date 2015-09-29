class CreatePaychecks < ActiveRecord::Migration
  def change
    create_table :paychecks do |t|
      t.string :name
      t.decimal :amount, :precision => 12, :scale =>2

      t.timestamps null: false
    end
  end
end
