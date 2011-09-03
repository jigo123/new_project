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

    it "should generate the full name from the first and last name" do
      user.name.should == "Full Name"
    end

  end

  context "Interests and groups with spaces and blank elements" do
    let(:user) { Factory(:user, :interests => 'chess , ,, football ', :groups => 'speaking , ,, BBB , , ') }

    it "should return an array of interests without spaces or blank values" do
      user.interests_array.should == ['chess', 'football']
    end

    it "should return an array of groups without spaces" do
      user.groups_array.should == ['speaking', 'BBB']
    end
  end

  context "Two Matching Users" do
    let(:user) { Factory(:user) }
    let(:user2) { Factory(:user) }
    
    it "should have matching names" do
      user.name.should == user2.name
    end

    it "should match" do
      user.match user2
      user.matches.should be_true
    end

    it "should match ten times" do
      user.match user2
      user.match_reasons.size.should == 10
    end

  end

  context "Two Matching Users Without Interests or Groups" do
    let(:user) { Factory(:user, :interests => nil, :groups => nil) }
    let(:user2) { Factory(:user, :interests => nil, :groups => nil) }
    
    it "should have matching names" do
      user.name.should == user2.name
    end

    it "should match" do
      user.match user2
      user.matches.should be_true
    end

    it "should match five times" do
      user.match user2
      user.match_reasons.size.should == 5
    end

  end  
end