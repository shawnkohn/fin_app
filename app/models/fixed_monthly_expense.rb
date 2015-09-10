class FixedMonthlyExpense < ActiveRecord::Base
	validates :expense, presence: true
	validates :amount, presence: true
end
