require "test_helper"

class BudgetLogicTest < ActionView::TestCase

    test "it determines step one completion date" do
        initialize_budget_logic(:one)
        start_date = Time.now
        goal_date = start_date + 26.months
        assert_equal(@budget_logic.step_one_met_date(start_date), goal_date)
    end

    test "it determines step one completion date for completed step one" do
        initialize_budget_logic(:two)
        start_date = Time.now
        assert_equal(@budget_logic.step_one_met_date(start_date), start_date)
    end

    private
    def initialize_budget_logic(budget_id)
        @budget = budgets(budget_id)
        @budget_logic = BudgetLogic.new(@budget)
    end


end
