class Test < ApplicationRecord
    validates_presence_of :test_customer, :test_scenario
    has_many :events, dependent: :destroy
end
