class DebtsController < ApplicationController
	
    def new
        @budget = Budget.find(params[:budget_id])
        @debt = Debt.new
	end
	
    
    def create
        @budget = Budget.find(params[:budget_id])
		if @budget.debts.create(debt_params)	
            redirect_to budget_debts_path(@budget)
		else
			render 'new'
		end
	end

	
	def edit
		@budget = Budget.find(params[:budget_id])
        @debt = @budget.debts.find(params[:id])
	end
    
    
	def update
		@budget = Budget.find(params[:budget_id])
        if @budget.debts.find(params[:id]).update(debt_params)
    	    redirect_to budget_debts_path(@budget)
        else
            render 'edit'
    	end
	end
    
   
    def destroy
		@budget = Budget.find(params[:budget_id])
        @budget.debts.find(params[:id]).destroy
 
		  redirect_to budget_debts_path(@budget)
	end
	


	def index
		@budget = Budget.find(params[:budget_id])
	end
	

	private
		def debt_params
			params.require(:debt).permit(:name, :balance, :minimum_monthly_payment, :interest_rate)
    end
end
