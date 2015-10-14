require "test_helper"

class StepOneLogicTest < ActionController::TestCase


    test "can determine if goal not met" do
        initialize_step_one(:one)
        assert_equal(@step_one_logic.is_met?, false)
    end
    
    test "can determine if goal met" do
        initialize_step_one(:three)
        assert_equal(@step_one_logic.is_met?, true)
    end

    test "can determine if goal met amounts equal" do
        initialize_step_one(:two)
        assert_equal(@step_one_logic.is_met?, true)
    end
            
    private
    def initialize_step_one(id)
        @step_one = step_ones(id)
        @step_one_logic = StepOneLogic.new(@step_one)
    end
end
