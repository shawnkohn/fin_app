require "test_helper"

class FixedMonthlyExpensesControllerTest < ActionController::TestCase
    
    setup :initialize_fixed_monthly_expense
    
    
    test "should get index" do
        get :index, budget_id: @budget
        assert_response :success
        assert_not_nil assigns(:budget)    
    end


    test "should get new" do
        get :new, budget_id: @budget
        assert_response :success
    end
    
    test "should create fixed_monthly_expense" do
        assert_difference('FixedMonthlyExpense.count') do
            post :create, budget_id: @budget, fixed_monthly_expense: {name: @fixed_monthly_expense.name, amount: @fixed_monthly_expense.amount}
        end
        assert_redirected_to budget_fixed_monthly_expenses_path(assigns(:budget))
    end
    
    test "sould get edit" do
        get :edit, budget_id: @budget, id: @fixed_monthly_expense
        assert_response :success
    end
    
    test "should update fixed_monthly_expense" do
        @fixed_monthly_expense.name = "Updated Expense Name"
        patch :update, budget_id: @budget, id: @fixed_monthly_expense, fixed_monthly_expense: {name: @fixed_monthly_expense.name, amount: @fixed_monthly_expense.amount}
        assert_redirected_to budget_fixed_monthly_expenses_path(assigns(:budget))
    end


    test "should destroy fixed_monthly_expense" do
        assert_difference('FixedMonthlyExpense.count', -1) do
            delete :destroy, budget_id: @budget, id: @fixed_monthly_expense
        end

        assert_redirected_to budget_fixed_monthly_expenses_path(assigns(:budget))
        
    end
    
    private
    def initialize_fixed_monthly_expense
        @budget = budgets(:one)
        @fixed_monthly_expense = fixed_monthly_expenses(:one)
    end

end
