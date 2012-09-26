class CitiesController < ApplicationController
  def new
  end
  
  def create
    @city_1_name = params[:city_1]
    @city_2_name = params[:city_2]
    @city_1_tweets = TweetHarvester.new(params[:city_1]).harvest
    @city_2_tweets = TweetHarvester.new(params[:city_2]).harvest
    @city_1_score = TweetAnalyzer.new(@city_1_tweets).analyze
    @city_2_score = TweetAnalyzer.new(@city_2_tweets).analyze
    render :show
  end
end