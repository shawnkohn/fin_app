class FixedMonthlyExpensesController < ApplicationController
        
    def new
        @budget = Budget.find(params[:budget_id])
        @fixed_monthly_expense = FixedMonthlyExpense.new 
    end

    
    def create
		@budget = Budget.find(params[:budget_id])
        if @budget.fixed_monthly_expenses.create(fixed_monthly_expense_params)
			redirect_to budget_fixed_monthly_expenses_path(@budget)
		else
			render 'new'
		end
	end

	
    def edit
		@budget = Budget.find(params[:budget_id])
        @fixed_monthly_expense = @budget.fixed_monthly_expenses.find(params[:id])
	end
    
	
    def update
		@budget = Budget.find(params[:budget_id])
        if @budget.fixed_monthly_expenses.find(params[:id]).update(fixed_monthly_expense_params)
    			redirect_to budget_fixed_monthly_expenses_path(@budget)
  		  else
    			render 'edit'
  		  end
	end
    
    
    def destroy
		@budget = Budget.find(params[:budget_id])
        @budget.fixed_monthly_expenses.find(params[:id]).destroy
 
        redirect_to budget_fixed_monthly_expenses_path(@budget)
    end
	
    
    def index
		@budget = Budget.find(params[:budget_id])
	end
	
    
    
    private
    def fixed_monthly_expense_params
        params.require(:fixed_monthly_expense).permit(:name, :amount)
    end

end
