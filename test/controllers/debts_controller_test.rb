require "test_helper"

class DebtsControllerTest < ActionController::TestCase
    
    setup :initialize_debt
    
    
    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:debts)
    end


    test "should get new" do
        get :new
        assert_response :success
    end
    

    test "should create debt" do
        assert_difference('Debt.count') do
            post :create, debt: {name: @debt.name, balance: @debt.balance, minimum_monthly_payment: @debt.minimum_monthly_payment, interest_rate: @debt.interest_rate}
        end

        assert_redirected_to debts_path(assigns(:debts))
    end

    test "sould get edit" do
        get :edit, id: @debt
        assert_response :success
    end

    test "should update debt" do
        @debt.name = "Updated Debt Name"
        patch :update, id: @debt, debt: {name: @debt.name, balance: @debt.balance, minimum_monthly_payment: @debt.minimum_monthly_payment, interest_rate: @debt.interest_rate}
        assert_redirected_to debts_path(assigns(:debts))
    end


    test "should destroy debt" do
        assert_difference('Debt.count', -1) do
            delete :destroy, id: @debt
        end

        assert_redirected_to debts_path(assigns(:debts))
        
    end

    private
    def initialize_debt
        @debt = debts(:one)
    end

end
