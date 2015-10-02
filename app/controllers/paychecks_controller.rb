class PaychecksController < ApplicationController

    def new    
        @budget = Budget.find(params[:budget_id])
        @paycheck = Paycheck.new
    end

     
    def create
        @budget = Budget.find(params[:budget_id])
        if @budget.paychecks.create(paycheck_params)
            redirect_to budget_paychecks_path(@budget)
        else
            render 'new'
        end
    end

    
    def edit
        @budget = Budget.find(params[:budget_id])
        @paycheck = @budget.paychecks.find(params[:id])
    end  

    
    def update  
        @budget = Budget.find(params[:budget_id])
        if @budget.paychecks.find(params[:id]).update(paycheck_params)
            redirect_to budget_paychecks_path(@budget)
        else
            render 'edit'
        end
    end
    
    
    def destroy    
        @budget = Budget.find(params[:budget_id])
        @paycheck = @budget.paychecks.find(params[:id])

        @paycheck.paycheck_deductions.destroy_all
        @paycheck.destroy
 
        redirect_to budget_paychecks_path(@budget)
    end      
      
 
    def index
        @budget = Budget.find(params[:budget_id])
    end

    
    def show
        @budget = Budget.find(params[:budget_id])
        @paycheck = @budget.paychecks.find(params[:id])
    end


    private

    def paycheck_params
        params.require(:paycheck).permit(:name, :amount)
    end

end
