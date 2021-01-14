rubocop: disable Metrics/BlockNesting, Layout/LineLength
require 'twitter'
require_relative '../lib/twitter'
system 'cls'
puts 'Welcome to Dr Robot! I am here to give you all the necessary information
about COVID, number of cases, nearby hospitals so you can
get medical assistance, in case you or your loved ones ever need it.'

set_config
twitter = TwitterAcc.new
twitter.help
is_on = true

while is_on
  selection = gets.chomp.to_i

  case selection
  when 0
    puts 'See you!'
    is_on = false
  when 1
    print 'Whats the sleep time? '
    sleep_time = gets.chomp
    twitter.mass_inform(sleep_time)
  when 2
    puts 'Please select one country: '
    invalid = true
    while invalid
      puts '1- Nigeria; 2- South Africa; 3- Kenya; 4- Cameroun; 5- Rwanda'
      q = gets.chomp.to_i
      if (1..5).include?(q)
        twitter.get_contry(q)
        invalid = false
      else
        puts 'Please, select a valid value (between 1 and 5)'
      end
    end
  when 3
    print 'Tweet: '
    tweet = gets.chomp
    twitter.update_tweet(tweet)
    twitter.help
  end
end
rubocop: enable Metrics/BlockNesting, Layout/LineLength
