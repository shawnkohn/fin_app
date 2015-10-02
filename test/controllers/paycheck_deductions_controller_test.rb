require "test_helper"

class PaycheckDeductionsControllerTest < ActionController::TestCase
    
    setup :initialize_paycheck_deduction
    
    test "should create paycheck deduction" do
        assert_difference('PaycheckDeduction.count') do
            post :create, budget_id: @budget, paycheck_id: @paycheck, paycheck_deduction: {name: @paycheck_deduction.name, amount: @paycheck_deduction.amount, is_tax_deductible: @paycheck_deduction.is_tax_deductible}
        end

        assert_redirected_to budget_paycheck_path(@budget, @paycheck)
    end


    test "should destroy paycheck deduction" do
        assert_difference('PaycheckDeduction.count', -1) do
            delete :destroy, budget_id: @budget, paycheck_id: @paycheck, id: @paycheck_deduction
        end

        assert_redirected_to budget_paycheck_path(@budget, @paycheck)
        
    end


    private
    def initialize_paycheck_deduction
        @budget = budgets(:one)
        @paycheck = paychecks(:one)
       @paycheck_deduction = paycheck_deductions(:one)
    end

end
