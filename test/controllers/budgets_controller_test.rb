require "test_helper"

class BudgetsControllerTest < ActionController::TestCase

    setup :initialize_budget

    test "sould get index" do
        get :index
        assert_response :success
    end


    test "should get new" do
        get :new
        assert_response :success
    end

    test "should create budget" do
        assert_difference('Budget.count') do
            post :create, budget: {name: "test budget", monthly_financial_goals_amount: 23.45}
        end

        assert_redirected_to budgets_index_path
    end

    test "should create budget using default monthly financial goals amount" do
        assert_difference('Budget.count') do
            post :create, budget: {name: "test budget"}
        end

        assert_redirected_to budgets_index_path
    end

    test "should get edit" do
        get :edit, id: @budget
        assert_response :success
    end

    test "should update budget" do
        @budget.name = "Updated Budget Name"
        patch :update, id: @budget, budget: {name: @budget.name, monthly_financial_goals_amount: @budget.monthly_financial_goals_amount}
        assert_redirected_to budgets_index_path
    end

    private
    def initialize_budget
        @budget = budgets(:one)
    end

    
end
