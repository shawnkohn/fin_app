class CreatePaycheckDeductions < ActiveRecord::Migration
  def change
    create_table :paycheck_deductions do |t|
      t.string :name
      t.decimal :amount
      t.boolean :is_tax_deductible

      t.timestamps null: false
    end
  end
end
