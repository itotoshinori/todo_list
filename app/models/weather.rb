class Weather
  def initialize(placecode)
    placecode = "130010" if placecode.nil?
    begin
      uri = URI.parse("https://weather.tsukumijima.net/api/forecast?city=#{placecode}")
      json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
      result = JSON.parse(json) #返り値をubyの配列に変
      @url1 = result['forecasts'][0]['image']['url']
      @url2 = result['forecasts'][1]['image']['url']
      @url3 = result['forecasts'][2]['image']['url']
      @information = true
    rescue => exception
      @information = false
    end
  end

  def re_info
    @information
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