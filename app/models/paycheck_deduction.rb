class PaycheckDeduction < ActiveRecord::Base
  belongs_to :paycheck
 
  validates :name, presence: true
  validates :amount, presence: true

  monetize :amount
end
