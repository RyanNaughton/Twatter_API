class Presenters::TweetPresenter

	def initialize(tweet)
		@tweet = tweet
	end
	
	def to_hash
		{:message => @tweet.message, :id=> @tweet.id}
	end

	
end
