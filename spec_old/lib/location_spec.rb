require 'spec_helper'

describe Location do
  it "should return the correct latlng for a valid address" do 
    @location = Location.new("419 Lafayette", "2nd flr", "New York", "ny", "10003")
    assert_equal 40.728601, @location.lat
    assert_equal -73.991972, @location.lng
  end
end
