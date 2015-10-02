class PaycheckDeductionsController < ApplicationController
    
    def create
        @budget = Budget.find(params[:budget_id])
        @paycheck = @budget.paychecks.find(params[:paycheck_id])
        @paycheck_deduction = @paycheck.paycheck_deductions.create(paycheck_deduction_params)
	
        redirect_to budget_paycheck_path(@budget, @paycheck)
    end

	
    def destroy    
        @budget = Budget.find(params[:budget_id])
        @paycheck = @budget.paychecks.find(params[:paycheck_id])
        @paycheck_deduction = @paycheck.paycheck_deductions.find(params[:id])
        @paycheck_deduction.destroy
        redirect_to budget_paycheck_path(@budget, @paycheck)    
    end
	
	
	private
    
    def paycheck_deduction_params
        params.require(:paycheck_deduction).permit(:name, :amount, :is_tax_deductible)
    end

end
