require "test_helper"

class FixedMonthlyExpensesControllerTest < ActionController::TestCase
    
    setup :initialize_fixed_monthly_expense
    
    
    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:fixed_monthly_expenses)
    end


    test "should get new" do
        get :new
        assert_response :success
    end
    

    test "should create fixed_monthly_expense" do
        assert_difference('FixedMonthlyExpense.count') do
            post :create, fixed_monthly_expense: {name: @fixed_monthly_expense.name, amount: @fixed_monthly_expense.amount}
        end

        assert_redirected_to fixed_monthly_expenses_path(assigns(:fixed_monthly_expenses))
    end

    test "sould get edit" do
        get :edit, id: @fixed_monthly_expense
        assert_response :success
    end

    test "should update fixed_monthly_expense" do
        @fixed_monthly_expense.name = "Updated Expense Name"
        patch :update, id: @fixed_monthly_expense, fixed_monthly_expense: {name: @fixed_monthly_expense.name, amount: @fixed_monthly_expense.amount}
        assert_redirected_to fixed_monthly_expenses_path(assigns(:fixed_monthly_expenses))
    end


    test "should destroy fixed_monthly_expense" do
        assert_difference('FixedMonthlyExpense.count', -1) do
            delete :destroy, id: @fixed_monthly_expense
        end

        assert_redirected_to fixed_monthly_expenses_path(assigns(:fixed_monthly_expenses))
        
    end

    private
    def initialize_fixed_monthly_expense
        @fixed_monthly_expense = fixed_monthly_expenses(:one)
    end

end
