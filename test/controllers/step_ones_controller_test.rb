require "test_helper"

class StepOnesControllerTest < ActionController::TestCase

    setup :initialize_step_ones

    test "should get edit" do
        get :edit, budget_id: @budget, id: @step_one
        assert_response :success
    end

    test "should update step_one" do
        @step_one.goal_balance=234
        patch :update, budget_id: @budget, id: @step_one, step_one: {current_balance: @step_one.current_balance, goal_balance: @step_one.goal_balance}
        assert_redirected_to welcome_index_path
    end

    private

    def initialize_step_ones
        @budget = budgets(:one)
        @step_one = step_ones(:one)
    end

end
