class WelcomeController < ApplicationController
  def index
          @step_one = StepOne.find(1)
          if (@step_one == nil)
                  @step_one = StepOne.new
          end

          @paycheck = Paycheck.find(1)
          if (@paycheck == nil)
                  @paycheck = Paycheck.new
          end
  end
end
