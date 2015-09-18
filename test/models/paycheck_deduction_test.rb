require "test_helper"

class PaycheckDeductionTest < ActiveSupport::TestCase
  def paycheck_deduction
    @paycheck_deduction ||= PaycheckDeduction.new
  end

  def test_valid
    assert paycheck_deduction.valid?
  end
end
