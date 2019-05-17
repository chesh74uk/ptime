require 'rails_helper'

RSpec.describe Scenario, type: :model do
    subject {described_class.new}
    
    
    it "is valid with valid attributes" do
        subject.scenario_name = "Anything"
        expect(subject).to be_valid
    end
    
    it "is not valid without a name" do
        subject.scenario_name = nil
        expect(subject).to_not be_valid
    end
    
    
end
