class Budget < ActiveRecord::Base

    has_many :paychecks
    has_many :paycheck_deudctions, through: :paychecks
    has_many :fixed_monthly_expenses
    has_many :debts
    has_one :step_one    

    validates :name, presence: true

    def monthly_gross_income
        monthly_gross = self.paychecks.sum(:amount)
        monthly_gross = monthly_gross *2
        return BigDecimal.new(monthly_gross.to_s)
    end

    def monthly_net_income
        monthly_deductions = BigDecimal.new("0")
        self.paychecks.each do |paycheck|
            monthly_deductions += paycheck.paycheck_deductions.sum(:amount)
        end

        monthly_deductions = monthly_deductions * 2
        monthly_net = self.monthly_gross_income - monthly_deductions

        return BigDecimal.new(monthly_net.to_s)
    end

    def monthly_fixed_expenses
        monthly_expenses = BigDecimal.new(self.fixed_monthly_expenses.sum(:amount).to_s)
        return monthly_expenses
    end
        
end
