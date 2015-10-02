class BudgetsController < ApplicationController

    def new
        @budget = Budget.new
    end

    def create
        @budget = Budget.new(budget_params)
        if @budget.save
            redirect_to welcome_index_path
        else
            render 'new'
        end
    end


    private

    def budget_params
        params.require(:budget).permit(:name)
    end 

end
