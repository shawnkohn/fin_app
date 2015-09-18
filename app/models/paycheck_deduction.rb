class PaycheckDeduction < ActiveRecord::Base
          validates :name, presence: true
          validates :amount, presence: true

          monetize :amount
end
