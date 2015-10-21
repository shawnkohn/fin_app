require "test_helper"

class BudgetTest < ActionView::TestCase


    test "it calculates monthly gross income using two periods" do
        @budget = initialize_budget(:one)
        assert_equal(@budget.total_monthly_gross_income, BigDecimal.new("3000"))
    end

    test "it calculates monthly deductions using two periods" do
        @budget = initialize_budget(:one)
        assert_equal(@budget.total_monthly_deductions, BigDecimal.new("25.38"))
    end

    test "it calculates monthly net income" do
        @budget = initialize_budget(:one)
        assert_equal(@budget.monthly_net_income, BigDecimal.new("2974.62"))
    end

    test "it calculates monthly fixed expenses" do
        @budget = initialize_budget(:one)
        assert_equal(@budget.monthly_fixed_expenses, BigDecimal.new("32.65"))
    end

    test "it calculates remaining after all expenses" do
        @budget = initialize_budget(:one)
        assert_equal(@budget.remaining_after_all_expenses, BigDecimal.new("2885.47"))
    end

    test "it calculates sum of minimum monthly debt payments" do
        @budget = initialize_budget(:one)
        assert_equal(@budget.minimum_monthly_debt_payments_sum, BigDecimal.new("22"))
    end


    test "it calculates monthly gross income using average" do
        @budget = initialize_budget(:two)
        assert_equal(@budget.total_monthly_gross_income, BigDecimal.new("1083.33"))
    end

    test "it calculates monthly deductions using average" do
        @budget = initialize_budget(:two)
        assert_equal(@budget.total_monthly_deductions, BigDecimal.new("3.25"))
    end

    test "it calculates non monthly expenses using biweekly extra" do
        @budget = initialize_budget(:one)
        assert_equal(@budget.total_non_monthly_expenses, BigDecimal("2974.62"))
    end


  private 
  def initialize_budget(budget_id)
      @budget = budgets(budget_id)
  end


end
