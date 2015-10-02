class StepOnesController < ApplicationController

    def update
        @budget = Budget.find(params[:budget_id])
        if @budget.step_one.update(step_one_params)
            redirect_to welcome_index_path
        else
            render 'edit'
        end
    end

  
    def edit
        @budget = Budget.find(params[:budget_id])
        @step_one = @budget.step_one
    end

    private
  
  
    def step_one_params
        params.require(:step_one).permit(:goal_balance, :current_balance)
    end


end
