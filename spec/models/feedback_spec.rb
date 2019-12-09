require 'rails_helper'

RSpec.describe Feedback, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:recipient) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:commentor_id) }

    it { should validate_presence_of(:comments) }

    it { should validate_presence_of(:recipient_id) }
      
    end
end
