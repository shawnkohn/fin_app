class FixedMonthlyExpensesController < ApplicationController
	def new
	end
	
	def create
		@fixed_monthly_expense = FixedMonthlyExpense.new(fixed_monthly_expense_params)
		
		@fixed_monthly_expense.save
		redirect_to @fixed_monthly_expense
	end

	def show
		@fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
	end

	private
		def fixed_monthly_expense_params
			params.require(:fixed_monthly_expense).permit(:expense, :amount)
	end
end
