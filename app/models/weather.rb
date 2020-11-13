class Weather
  def initialize(placecode)
    #placecode = User.find(@cookies[:userid].to_i).placecode
    #city_code = "130010"
    placecode = "130010" if placecode.nil?
    uri = URI.parse("https://weather.tsukumijima.net/api/forecast?city=#{placecode}")
    json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
    result = JSON.parse(json) #返り値をubyの配列に変
    @url1 = result['forecasts'][0]['image']['url']
    @url2 = result['forecasts'][1]['image']['url']
    @url3 = result['forecasts'][2]['image']['url']
  end

  def display1
    @url1
  end

  def display2
    @url2
  end

  def display3
    @url3
  end
end