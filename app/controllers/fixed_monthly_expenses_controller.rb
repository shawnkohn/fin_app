class FixedMonthlyExpensesController < ApplicationController
	def new
		@fixed_monthly_expense = FixedMonthlyExpense.new
	end

	def destroy
  		@fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
  		@fixed_monthly_expense.destroy
 
		  redirect_to fixed_monthly_expenses_path
	end
	
	def update
  		@fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
 
		  if @fixed_monthly_expense.update(fixed_monthly_expense_params)
    			redirect_to welcome_index
  		  else
    			render 'edit'
  		  end
	end

	def edit
		@fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
	end

	def index
		@fixed_monthly_expenses = FixedMonthlyExpense.all
	end
	
	def create
		@fixed_monthly_expense = FixedMonthlyExpense.new(fixed_monthly_expense_params)
		if @fixed_monthly_expense.save
			redirect_to @fixed_monthly_expense
		else
			render 'new'
		end
	end

	def show
		@fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
	end

	private
		def fixed_monthly_expense_params
			params.require(:fixed_monthly_expense).permit(:expense, :amount)
    end
end
