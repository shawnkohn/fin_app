require "test_helper"

class BudgetsControllerTest < ActionController::TestCase

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


    
end
