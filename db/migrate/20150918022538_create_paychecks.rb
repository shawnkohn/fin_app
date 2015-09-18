class CreatePaychecks < ActiveRecord::Migration
  def change
    create_table :paychecks do |t|
      t.string :name
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
