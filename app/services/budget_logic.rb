class BudgetLogic

    def initialize (budget)
        @budget = budget
        @step_one_logic = StepOneLogic.new(@budget.step_one)
    end

    def step_one_met_date(start_date)
        if (@step_one_logic.is_met?)
            return start_date
        end

        remaining_balance = @budget.step_one.goal_balance-@budget.step_one.current_balance
        months_rounded_up = remaining_balance / @budget.monthly_financial_goals_amount
        months_rounded_up = months_rounded_up.ceil

        return start_date + months_rounded_up.months
    end
end
