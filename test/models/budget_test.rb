require "test_helper"

class BudgetTest < ActionView::TestCase
    setup :initialize_budget



    test "it calculates monthly gross income" do
        assert_equal(@budget.total_monthly_gross_income, BigDecimal.new("3000"))
    end

    test "it calculates total biweekly deductions" do
        assert_equal(@budget.total_monthly_deductions, BigDecimal.new("25.38"))
    end

    test "it calculates monthly net income" do
        assert_equal(@budget.monthly_net_income, BigDecimal.new("2974.62"))
    end

    test "it calculates monthly fixed expenses" do
        assert_equal(@budget.monthly_fixed_expenses, BigDecimal.new("32.65"))
    end

    test "it calculates remaining after fixed expenses" do
        assert_equal(@budget.remaining_after_all_expenses, BigDecimal.new("2885.47"))
    end

    test "it calculates sum of minimum monthly debt payments" do
        assert_equal(@budget.minimum_monthly_debt_payments_sum, BigDecimal.new("22"))
    end


    test "it calculates monthly gross income using average" do
        @budget = budgets(:two)
        assert_equal(@budget.total_monthly_gross_income, BigDecimal.new("1083.33"))
    end

    test "it calculates monthly deductions using average" do
        @budget = budgets(:two)
        assert_equal(@budget.total_monthly_deductions, BigDecimal.new("3.25"))
    end

  private 
  def initialize_budget
      @budget = budgets(:one)
  end


end
