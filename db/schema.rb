# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151015140956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.datetime "created_at",                                                                         null: false
    t.datetime "updated_at",                                                                         null: false
    t.string   "name"
    t.decimal  "monthly_financial_goals_amount",              precision: 12, scale: 2, default: 0.0
    t.boolean  "calculate_income_using_two_biweekly_periods"
    t.decimal  "non_monthly_expense_amount",                  precision: 12, scale: 2, default: 0.0
    t.boolean  "use_biweekly_extra_for_non_monthly_expenses"
  end

  create_table "debts", force: :cascade do |t|
    t.string   "name"
    t.decimal  "balance",                 precision: 12, scale: 2
    t.decimal  "minimum_monthly_payment", precision: 12, scale: 2
    t.decimal  "interest_rate",           precision: 7,  scale: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "budget_id"
  end

  add_index "debts", ["budget_id"], name: "index_debts_on_budget_id", using: :btree

  create_table "fixed_monthly_expenses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount",     precision: 12, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "budget_id"
  end

  add_index "fixed_monthly_expenses", ["budget_id"], name: "index_fixed_monthly_expenses_on_budget_id", using: :btree

  create_table "paycheck_deductions", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount",            precision: 12, scale: 2
    t.boolean  "is_tax_deductible"
    t.integer  "paycheck_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "paycheck_deductions", ["paycheck_id"], name: "index_paycheck_deductions_on_paycheck_id", using: :btree

  create_table "paychecks", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount",     precision: 12, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "budget_id"
  end

  add_index "paychecks", ["budget_id"], name: "index_paychecks_on_budget_id", using: :btree

  create_table "step_ones", force: :cascade do |t|
    t.decimal  "goal_balance",    precision: 12, scale: 2
    t.decimal  "current_balance", precision: 12, scale: 2
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "budget_id"
  end

  add_index "step_ones", ["budget_id"], name: "index_step_ones_on_budget_id", using: :btree

  add_foreign_key "debts", "budgets"
  add_foreign_key "fixed_monthly_expenses", "budgets"
  add_foreign_key "paycheck_deductions", "paychecks"
  add_foreign_key "paychecks", "budgets"
  add_foreign_key "step_ones", "budgets"
end
