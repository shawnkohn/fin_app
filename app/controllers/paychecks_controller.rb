class PaychecksController < ApplicationController

    def new    
        @paycheck = Paycheck.new
    end

     
    def create
        @paycheck = Paycheck.new(paycheck_params)
        if @paycheck.save
            redirect_to paychecks_path
        else
            renter 'new'
        end
    end

    
    def edit
        @paycheck = Paycheck.find(params[:id])
    end  

    
    def update  
        @paycheck = Paycheck.find(params[:id])
        if @paycheck.update(paycheck_params)      
            redirect_to paychecks_path
        else
            render 'edit'
        end
    end
    
    
    def destroy    
        @paycheck = Paycheck.find(params[:id])
        @paycheck.destroy
 
        redirect_to paychecks_path
    end      
      
 
    def index
        @paychecks = Paycheck.all
    end

    
    def show
        @paycheck = Paycheck.find(params[:id])
    end


    private

    def paycheck_params
        params.require(:paycheck).permit(:name, :amount)
    end

end
