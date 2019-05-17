require 'rails_helper'

RSpec.describe Test, type: :model do
  subject {described_class.new}
    
    
    it "is valid with valid attributes" do
        subject.test_customer = "Customer"
        subject.test_scenario = "Scenario"
        expect(subject).to be_valid
    end
    
    it "is not valid without a customer" do
        subject.test_customer = nil
        expect(subject).to_not be_valid
    end
    
    it "is not valid without a scenario" do
        subject.test_scenario = nil
        expect(subject).to_not be_valid
    end
end
