class StepOne < ActiveRecord::Base

    belongs_to :budget
  
    validates :goal_balance, presence: true
    validates :current_balance, presence: true

    monetize :goal_balance
    monetize :current_balance
end
