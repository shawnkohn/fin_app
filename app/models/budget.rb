class Budget < ActiveRecord::Base

    has_many :paychecks
    has_many :fixed_monthly_expenses
    has_many :debts
    has_one :step_one    

    validates :name, presence: true

end
