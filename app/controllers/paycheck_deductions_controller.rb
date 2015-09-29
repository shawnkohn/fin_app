class PaycheckDeductionsController < ApplicationController
    
    def new
        @paycheck = Paycheck.new
    end
    
    def create
        @paycheck = Paycheck.find(params[:paycheck_id])
        @paycheck_deduction = @paycheck.paycheck_deductions.create(paycheck_deduction_params)
	
        redirect_to paycheck_path(@paycheck)
    end

	
    def destroy    
        @paycheck = Paycheck.find(params[:paycheck_id])
        @paycheck_deduction = @paycheck.paycheck_deductions.find(params[:id])
        @paycheck_deduction.destroy
        redirect_to paycheck_path(@paycheck)    
    end
	
	
	private
    
    def paycheck_deduction_params
        params.require(:paycheck_deduction).permit(:name, :amount, :is_tax_deductible)
    end

end
