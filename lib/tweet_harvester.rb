require 'rubygems'
require 'json'
require 'net/http'
require 'uri'

class TweetHarvester
  attr_accessor :tweets
  TWITTER_URL = "http://search.twitter.com/search.json"
  
  def initialize(search_term, page=1, per_page=1000)
    @search_term = URI.escape(search_term)
    @page = page
    @per_page = per_page
  end
  
  def harvest
    url = "#{TWITTER_URL}?q=#{@search_term}&rpp=#{@per_page}&page=#{@page}"
    response = Net::HTTP.get_response(URI.parse(url))
    result = JSON.parse(response.body)
    @tweets = result['results'].collect{|result| result['text']}
  end
end