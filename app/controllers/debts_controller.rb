class DebtsController < ApplicationController
	def new
		@debt = Debt.new
	end
	
    
    def create
		@debt = Debt.new(debt_params)
		if @debt.save
			redirect_to debts_path
		else
			render 'new'
		end
	end

	
	def edit
		@debt = Debt.find(params[:id])
	end
    
    
	def update
  		@debt = Debt.find(params[:id])
 
		  if @debt.update(debt_params)
    			redirect_to debts_path
  		  else
    			render 'edit'
  		  end
	end
    
   
    def destroy
  		@debt = Debt.find(params[:id])
  		@debt.destroy
 
		  redirect_to debts_path
	end
	


	def index
		@debts = Debt.all
	end
	

	private
		def debt_params
			params.require(:debt).permit(:name, :balance, :minimum_monthly_payment, :interest_rate)
    end
end
