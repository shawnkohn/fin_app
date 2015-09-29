class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.string :name
      t.decimal :balance, :precision => 12, :scale => 2
      t.decimal :minimum_monthly_payment, :precision => 12, :scale => 2
      t.decimal :interest_rate, :precision => 7, :scale => 4

      t.timestamps null: false
    end
  end
end
