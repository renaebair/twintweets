class TweetSentiment
  attr_reader :city_1_score, :city_2_score
  def compare(city1, city2)
    city_1_tweets = TweetHarvester.new(city1).harvest
    city_2_tweets = TweetHarvester.new(city2).harvest
    @city_1_score = TweetAnalyzer.new(city_1_tweets).analyze
    @city_2_score = TweetAnalyzer.new(city_2_tweets).analyze
  end
end