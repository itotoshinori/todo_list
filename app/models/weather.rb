class Weather
  def display
    city_code = "130010"
    uri = URI.parse("https://weather.tsukumijima.net/api/forecast?city=#{city_code}")
    json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
    result = JSON.parse(json) #返り値をubyの配列に変
    url1 = result['forecasts'][0]['image']['url']
    date1 = result['forecasts'][0]['date']
    url2 = result['forecasts'][1]['image']['url']
    date2 = result['forecasts'][1]['date']
    url3 = result['forecasts'][2]['image']['url']
    date3 = result['forecasts'][2]['date']
    dis = ""
    day = day.to_s
    dis = []
    dis << url1
    dis << url2
  end
end