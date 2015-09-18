class PaychecksController < ApplicationController

        def new
                @paycheck = Paycheck.new
        end

        def create
                @paycheck = Paycheck.new(paycheck_params)
                @paycheck.save
                redirect_to :back
        end

  def update
          @paycheck = Paycheck.find(params[:id])
          if @paycheck.update(paycheck_params)
                  redirect_to :back
          else
                  render 'edit'
          end
  end

  def edit
          @paycheck = Paycheck.find(params[:id])
  end  

  private
  
  def paycheck_params
          params.require(:paycheck).permit(:name, :amount)
  end
end
