# this script uses the twitter api to find the twitter handles of footballers

require 'rubygems'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

footballdatabase = [ "Ben Foster", "Jonas Olsson", "Chris Baird", "Yacob", "Joleon Lescott", "Craig Gardner", "Ideye", "Boaz Myhill", "Jason Davidson", "Pocognoli", "Gamboa", "Cristiano Ronaldo"]

footballdatabase.each do |x|
  @twitter = client.user_search(x, options = {count: 5})
  footballers = @twitter
  footballers.each do |footballer|
    if (footballer.name.include? x) && client.user(footballer.screen_name).verified?
        puts "#{footballer.name}: #{footballer.screen_name}" 
    end 
  end
end


