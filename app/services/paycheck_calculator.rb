class PaycheckCalculator

    def initialize(paycheck)
        @paycheck = paycheck
    end

    def deduction_sum
        sum = BigDecimal.new("0")

        @paycheck.paycheck_deductions.each do |deduction|
            sum = sum + BigDecimal.new(deduction.amount.to_s)
        end

        return sum
            
    end

    def net_pay
        net_pay_amt =  BigDecimal.new(@paycheck.amount.to_s)
        @paycheck.paycheck_deductions.each do |deduction|
            net_pay_amt = net_pay_amt - BigDecimal.new(deduction.amount.to_s)
        end

        return net_pay_amt
    end
end
