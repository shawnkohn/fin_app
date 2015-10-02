class Paycheck < ActiveRecord::Base

    belongs_to :budget
    has_many :paycheck_deductions

        validates :name, presence: true
        validates :amount, presence: true

        monetize :amount

end
