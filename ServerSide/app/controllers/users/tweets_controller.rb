class Users::TweetsController < ApplicationController
	
	respond_to :json
	before_filter :load_user
	
	
	def index
		@tweets = @user.tweets
		@presenters = @tweets.map{|tweet| Presenters::TweetPresenter.new(tweet)}
		
		render :json => @presenters, :callback => params[:callback]
	end
	 
	def create
		tweet = @user.tweets.new(params[:tweet])
		if tweet.valid?
			tweet.save
			render :nothing => true
		else
			render :nothing => true, :status => 400
		end
		
	end
	
	private
	def load_user
		@user = User.find_by_name!(params[:user_id])
	end
	
	
end
