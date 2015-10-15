class Budget < ActiveRecord::Base

    has_many :paychecks
    has_many :paycheck_deudctions, through: :paychecks
    has_many :fixed_monthly_expenses
    has_many :debts
    has_one :step_one    

    validates :name, presence: true

    monetize :monthly_financial_goals_amount


    def total_monthly_gross_income
        biweekly_gross = self.paychecks.sum(:amount)
        monthly_gross = calculate_monthly(biweekly_gross)
        return BigDecimal.new(monthly_gross.to_s)
    end


    def total_monthly_deductions
        biweekly_deductions = 0.0 
        self.paychecks.each do |paycheck|
            biweekly_deductions += paycheck.paycheck_deductions.sum(:amount)
        end

        monthly_deductions = calculate_monthly(biweekly_deductions)
        return BigDecimal.new(monthly_deductions.to_s)
    end

    def monthly_net_income
        monthly_net = self.total_monthly_gross_income - self.total_monthly_deductions

        return BigDecimal.new(monthly_net.to_s)
    end

    def monthly_fixed_expenses
        monthly_expenses = BigDecimal.new(self.fixed_monthly_expenses.sum(:amount).to_s)
        return monthly_expenses
    end

    def remaining_after_all_expenses
        remaining = self.monthly_net_income - self.monthly_fixed_expenses - self.monthly_financial_goals_amount - self.minimum_monthly_debt_payments_sum
        return BigDecimal.new(remaining.to_s)
    end

    def minimum_monthly_debt_payments_sum
        sum = BigDecimal.new(self.debts.sum(:minimum_monthly_payment).to_s)
        return sum
    end

    private
    def calculate_monthly(biweekly_amount)
        if self.calculate_income_using_two_biweekly_periods
            return biweekly_amount * 2
        else
            return ((biweekly_amount*26)/12).round(2)
        end
    end
    
end
