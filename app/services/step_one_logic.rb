class StepOneLogic

    def initialize(step_one)
        @step_one = step_one
    end


    def is_met?
        return @step_one.current_balance >= @step_one.goal_balance
    end
end
