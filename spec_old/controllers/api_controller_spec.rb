require 'spec_helper'

describe ApiController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'checkin'" do
    it "should return null for invalid email and password" do
      post 'checkin', {:format => 'json', :email => 'wrong-email', :password => 'wrong-password'}
      @response.content_type.should == "application/json"
      response.should be_success
      @response.body.should == 'null'
    end

    it "should return at least one match for a valid email, password and location id" do
      @user = Factory(:user)
      get 'checkin', {:email => @user.email, :password => @user.password, :id => 'SG_4ahRExz3iKlEjoeSZk7b9G_40.728714_-73.992082'}
      @response.content_type.should == "application/json"
      response.should be_success
      puts @response.body
      @response.body.should_not == 'null'
    end
  end
  
  describe "POST 'login'" do
    it "should return the test user for valid email and password" do
      @user = Factory(:user)
      post 'login', {:email => @user.email, :password => @user.password}
      @response.content_type.should == "application/json"
      response.should be_success
      @json = JSON.parse(@response.body)
      @json["user"]["username"].should == 'TestUsername'
    end

    it "should return a null user for invalid email and password" do
      @user = Factory(:user)
      post 'login', {:email => 'wrong-email', :password => 'wrong-password'}
      @response.content_type.should == "application/json"
      response.should be_success
      @response.body.should == 'null'
    end
  end

  describe "GET 'places'" do
    it "should return null if invalid email/password" do
      get 'places', {:email => 'wrong-email', :password => 'wrong-password'}
      @response.content_type.should == "application/json"
      response.should be_success
      @response.body.should == 'null'
    end

    it "should return a list of locations if valid email/password and lat/lng" do
      @user = Factory(:user)
      get 'places', {:email => @user.email, :password => @user.password, :lat => '40.728601', :lng => '-73.991972'}
      @response.content_type.should == "application/json"
      response.should be_success
      @response.body.should_not == 'null'
    end
  end

end
