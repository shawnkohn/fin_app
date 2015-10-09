require "test_helper"

class PaycheckTest < ActiveSupport::TestCase
    setup :initialize_paycheck

    
    test "it calculates net pay" do
        assert BigDecimal.new("1188.81") == @paycheck.net_pay
    end
   

    private
    def initialize_paycheck
        @paycheck = paychecks(:one)
        @paycheck.paycheck_deductions.build
    end

end
