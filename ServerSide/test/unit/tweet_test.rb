require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "It requires a message" do
  	tweet = Tweet.new(:message => nil)
  	
  	assert(!tweet.valid?)
  end
  		
end
