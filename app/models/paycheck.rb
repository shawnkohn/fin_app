class Paycheck < ActiveRecord::Base
        has_many :paycheck_deductions

        validates :name, presence: true
        validates :amount, presence: true
end
