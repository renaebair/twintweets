class TweetAnalyzer
  
  def initialize(tweets)
    @tweets = tweets
    load_dictionary
  end
  
  def analyze
    sentiments = @tweets.collect do |tweet|
      extract_sentiment(tweet)
    end
    sentiments.compact!
    average(sentiments)
  end
  
  def extract_sentiment(tweet)
    values = tweet.split.collect do |word|
      score(word)
    end
    values.compact!
    average(values)
  end
  
  def average(values)
    return if values.size == 0
    values.sum / values.count
  end
  
  def score(word)
    @dictionary[word]
  end
  
  def load_dictionary
    @dictionary = {}
    file = File.expand_path(File.dirname(__FILE__) + "/sentiment_dictionary.txt")
    File.open(file, "r").each_line do |line|
      score, term = line.split(/\t/)
      @dictionary[term.strip] = score.to_f
    end
  end
end