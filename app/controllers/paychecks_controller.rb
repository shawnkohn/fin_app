class PaychecksController < ApplicationController

        def new
                @paycheck = Paycheck.new
        end

        def create
                @paycheck = Paycheck.new(paycheck_params)
                @paycheck.save
                redirect_to @paycheck
        end


  def destroy
      @paycheck = Paycheck.find(params[:id])
      @paycheck.destroy
 
      redirect_to paychecks_path
  end      
      
  def update
          @paycheck = Paycheck.find(params[:id])
          if @paycheck.update(paycheck_params)
                  redirect_to welcome_index
          else
                  render 'edit'
          end
  end

  def show
    @paycheck = Paycheck.find(params[:id])
  end    

  def edit
          @paycheck = Paycheck.find(params[:id])
  end  
  
  def index
          @paychecks = Paycheck.all
  end
  private
  
  def paycheck_params
          params.require(:paycheck).permit(:name, :amount)
  end
end
