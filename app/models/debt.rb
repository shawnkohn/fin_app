class Debt < ActiveRecord::Base

  belongs_to :budget

  validates :name, presence: true
  validates :balance, presence: true
  validates :minimum_monthly_payment, presence: true
  validates :interest_rate, presence: true
  
  monetize :balance
  monetize :minimum_monthly_payment
end
