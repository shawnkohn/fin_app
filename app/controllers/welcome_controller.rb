class WelcomeController < ApplicationController
  def index
          if (StepOne.exists?(1))
              @step_one = StepOne.find(1)
          else
              @step_one = StepOne.new
          end

          if (Paycheck.exists?(1))
                  @paycheck = Paycheck.find(1)
          end
                  #else
          #        @paycheck = Paycheck.new
          #end
         
 # end
  end
end
