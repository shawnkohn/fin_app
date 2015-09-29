class FixedMonthlyExpensesController < ApplicationController

        
    def new
        @fixed_monthly_expense = FixedMonthlyExpense.new
    end

    
    def create
		@fixed_monthly_expense = FixedMonthlyExpense.new(fixed_monthly_expense_params)
		if @fixed_monthly_expense.save
			redirect_to fixed_monthly_expenses_path
		else
			render 'new'
		end
	end

	
    def edit
		@fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
	end
    
	
    def update
  		@fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
 
		  if @fixed_monthly_expense.update(fixed_monthly_expense_params)
    			redirect_to fixed_monthly_expenses_path
  		  else
    			render 'edit'
  		  end
	end
    
    
    def destroy
        @fixed_monthly_expense = FixedMonthlyExpense.find(params[:id])
        @fixed_monthly_expense.destroy
 
        redirect_to fixed_monthly_expenses_path
    end
	
    
    def index
		@fixed_monthly_expenses = FixedMonthlyExpense.all
	end
	
    
    
    private
    def fixed_monthly_expense_params
        params.require(:fixed_monthly_expense).permit(:name, :amount)
    end

end
