class Tweet < ActiveRecord::Base
	
	belongs_to :user
	validates :message, :presence => true, :length => 1..140
	
end
