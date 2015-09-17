class StepOne < ActiveRecord::Base
  validates :goal_balance, presence: true
  validates :current_balance, presence: true

  monetize :goal_balance
  monetize :current_balance
end
