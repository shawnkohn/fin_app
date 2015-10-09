class Paycheck < ActiveRecord::Base

    belongs_to :budget
    has_many :paycheck_deductions

        validates :name, presence: true
        validates :amount, presence: true

        monetize :amount

    def net_pay
        net_pay_amt =  BigDecimal.new(self.amount.to_s)

        net_pay_amt = net_pay_amt - BigDecimal.new(self.paycheck_deductions.sum(:amount).to_s)

        return net_pay_amt
    end


end
