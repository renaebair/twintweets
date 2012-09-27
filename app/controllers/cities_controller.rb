class CitiesController < ApplicationController
  def new
  end
  
  def create
    @city_1_name = params[:city_1]
    @city_2_name = params[:city_2]
    @sentiment = TweetSentiment.new
    @sentiment.compare(@city_1_name, @city_2_name)
    render :show
  end
end