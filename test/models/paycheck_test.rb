require "test_helper"

class PaycheckTest < ActiveSupport::TestCase
  def paycheck
    @paycheck ||= Paycheck.new
  end

  def test_valid
    assert paycheck.valid?
  end
end
