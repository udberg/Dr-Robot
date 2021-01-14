require 'rest-client'
require 'json'

class CovidNumbers
  def initialize
  @country = ''
  end

  def get_contry(query)
    case query
    when 1
      @country = 'Nigeria'
    when 2
      @country = 'South Africa'
    when 3
      @country = 'Kenya'
    when 4
      @country = 'Cameroun'
    when 5
      @country = 'Rwanda'
    end
    inform(@country)
  end

  def inform(query)
    base_url = 'https://api.covid19api.com/total/country/'
    begin
      resp = RestClient.get "#{base_url}#{query}"
      @data = JSON.parse(resp.body)
      @data = @data[-1]
      text = "Last numbers of Covid19 in #{@data['Country']}:
      Cases: #{@data['Confirmed']},
       Deaths: #{@data['Deaths']}"
      puts text
      update_tweet(text)
      help
    rescue RestClient::ExceptionWithResponse => e
      puts 'We had a connection issue, please try again!'
      e.response
      help
    end
  end
end
# rubocop:enable:
