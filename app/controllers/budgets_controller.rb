class BudgetsController < ApplicationController

    def index
        @budget = Budget.first

        if (@budget == nil)
            redirect_to new_budget_path
        else
            @step_one = @budget.step_one
            
            if (@step_one == nil)
                @step_one = @budget.create_step_one(current_balance: 0, goal_balance: 0)
            end
        end
    end

    def new
        @budget = Budget.new
    end

    def create
        @budget = Budget.new(budget_params)
        if @budget.save
            redirect_to budgets_index_path
        else
            render 'new'
        end
    end

    def edit
        @budget = Budget.find(params[:id])
    end

    def update 
        @budget=Budget.find(params[:id])
        if (@budget.update(budget_params))
            redirect_to budgets_index_path
        else
            render 'edit'
        end
    end


    private

    def budget_params
        params.require(:budget).permit(:name, :monthly_financial_goals_amount)
    end 

end
