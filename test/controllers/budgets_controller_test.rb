require "test_helper"

class BudgetsControllerTest < ActionController::TestCase

    test "should create budget" do
        assert_difference('Budget.count') do
            post :create, budget: {name: "test budget"}
        end

        assert_redirected_to welcome_index_path
    end
    
end
