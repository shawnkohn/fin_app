require "test_helper"

class PaychecksControllerTest < ActionController::TestCase
    
    setup :initialize_paycheck
    
    
    test "should get index" do
        get :index, budget_id: @budget
        assert_response :success
        assert_not_nil assigns(:budget)    
    end


    test "should get new" do
        get :new, budget_id: @budget
        assert_response :success
    end
    
    test "should create paycheck" do
        assert_difference('Paycheck.count') do
            post :create, budget_id: @budget, paycheck: {name: @paycheck.name, amount: @paycheck.amount}
        end
        assert_redirected_to budget_paychecks_path(assigns(:budget))
    end
    
    test "sould get edit" do
        get :edit, budget_id: @budget, id: @paycheck
        assert_response :success
    end
    
    test "should update paycheck" do
        @paycheck.name = "Updated Expense Name"
        patch :update, budget_id: @budget, id: @paycheck, paycheck: {name: @paycheck.name, amount: @paycheck.amount}
        assert_redirected_to budget_paychecks_path(assigns(:budget))
    end


    test "should destroy paycheck" do
        assert_difference('Paycheck.count', -1) do
            delete :destroy, budget_id: @budget, id: @paycheck
        end

        assert_redirected_to budget_paychecks_path(assigns(:budget))
        
    end
    
    private
    def initialize_paycheck
        @budget = budgets(:one)
        @paycheck = paychecks(:one)
    end

end
