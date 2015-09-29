require 'test_helper'


class PaycheckCalculatorTest < ActiveSupport::TestCase

    setup :initialize_paycheck_calculator

    test "it calculates deduction sum" do
        assert @calculator.deduction_sum == BigDecimal.new("11.19")
    end

    test "it calculates net pay" do
        assert BigDecimal.new("1188.81") == @calculator.net_pay
    end

    private
    def initialize_paycheck_calculator
        @paycheck = paychecks(:one)
        @paycheck.paycheck_deductions.build

        @calculator = PaycheckCalculator.new(@paycheck)
    end

end
