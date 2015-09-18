class PaycheckDeductionsController < ApplicationController
	def new
		@paycheck_deduction = PaycheckDeduction.new
	end

	def destroy
  		@paycheck_deduction = PaycheckDeduction.find(params[:id])
  		@paycheck_deduction.destroy
 
		  redirect_to paycheck_deductions_path
	end
	
	def update
  		@paycheck_deduction = PaycheckDeduction.find(params[:id])
 
		  if @paycheck_deduction.update(paycheck_deduction_params)
    			redirect_to welcome_index
  		  else
    			render 'edit'
  		  end
	end

	def edit
		@paycheck_deduction = PaycheckDeduction.find(params[:id])
	end

	def index
		@paycheck_deductions = PaycheckDeduction.all
	end
	
	def create
		@paycheck_deduction = PaycheckDeduction.new(paycheck_deduction_params)
		if @paycheck_deduction.save
			redirect_to @paycheck_deduction
		else
			render 'new'
		end
	end

	def show
		@paycheck_deduction = PaycheckDeduction.find(params[:id])
	end

	private
		def paycheck_deduction_params
			params.require(:paycheck_deduction).permit(:name, :amount, :is_tax_deductible)
    end
end
