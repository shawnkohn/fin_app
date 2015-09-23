class WelcomeController < ApplicationController
  def index
          if (StepOne.exists?(1))
              @step_one = StepOne.find(1)
          else
              @step_one = StepOne.new
              @step_one.goal_balance = 0
              @step_one.current_balance = 0
              @step_one.save
          end

          if (Paycheck.exists?(1))
                  @paycheck = Paycheck.find(1)
          else
                 @paycheck = Paycheck.new
          end
  end
end
