class WelcomeController < ApplicationController

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

end
