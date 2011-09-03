require 'spec_helper'

describe User do

  context "Registered User" do
    let(:user) { Factory(:user, :first_name=>'Full', :last_name => 'Name') }
    
    it "should have a username" do
      user.name.should_not be_nil
    end
    
    it "should have an email" do
      user.email.should_not be_nil
    end

    it "should have a profile" do
      user.bio.should_not be_nil
    end
        
    it "should have agreed to terms" do
      user.terms.should be_true
    end

    it "should generate the full name from the first and last name" do
      user.name.should == "Full Name"
    end
    
  end
end