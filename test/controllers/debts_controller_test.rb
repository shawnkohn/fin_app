require "test_helper"

class DebtsControllerTest < ActionController::TestCase
    setup :initialize_debt
   
    
    test "should get index" do
        get :index, budget_id: @budget
        assert_response :success
        assert_not_nil assigns(:budget)
    end

    test "should get new" do
        get :new, budget_id: @budget
        assert_response :success
    end
    

    test "should create debt" do
        assert_difference('Debt.count') do
            post :create, budget_id: @budget, debt: {name: @debt.name, balance: @debt.balance, minimum_monthly_payment: @debt.minimum_monthly_payment, interest_rate: @debt.interest_rate}
        end

        assert_redirected_to budget_debts_path(assigns(:budget))
    end

    test "sould get edit" do
        get :edit, budget_id: @budget, id: @debt
        assert_response :success
    end

    test "should update debt" do
        @debt.name = "Updated Debt Name"
        patch :update, budget_id: @budget, id: @debt, debt: {name: @debt.name, balance: @debt.balance, minimum_monthly_payment: @debt.minimum_monthly_payment, interest_rate: @debt.interest_rate}
        assert_redirected_to budget_debts_path(assigns(:budget))
    end


    test "should destroy debt" do
        assert_difference('Debt.count', -1) do
            delete :destroy, budget_id: @budget, id: @debt
        end

        assert_redirected_to budget_debts_path(assigns(:budget))
        
    end
    
    private
    def initialize_debt
        @debt = debts(:one)
        @budget = budgets(:one)
    end
end
