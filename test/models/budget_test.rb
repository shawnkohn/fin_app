require "test_helper"

class BudgetTest < ActiveSupport::TestCase
    setup :initialize_budget



    test "it calculates monthly gross income" do
        assert @budget.monthly_gross_income == BigDecimal.new("3000")
    end
  
    test "it calculates monthly net income" do
        assert @budget.monthly_net_income == BigDecimal.new("2974.62")
    end

    test "it calculates monthly fixed expenses" do
        assert @budget.monthly_fixed_expenses == BigDecimal.new("32.65")
    end

  private 
  def initialize_budget
      @budget = budgets(:one)
  end


end
