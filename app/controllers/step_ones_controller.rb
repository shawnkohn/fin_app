class StepOnesController < ApplicationController

        def new
                @step_one = StepOne.new
        end

        def create
                @step_one = StepOne.new(step_one_params)
                @step_one.save
                redirect_to @step_one
        end

  def update
          @step_one = StepOne.find(params[:id])
          if @step_one.update(step_one_params)
                  redirect_to @step_one
          else
                  render 'edit'
          end
  end

  def edit
          @step_one = StepOne.find(params[:id])
  end  

  private
  
  def step_one_params
          params.require(:step_one).permit(:goal_balance, :current_balance)
  end
end
