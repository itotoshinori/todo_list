require 'rails_helper'

RSpec.describe Weather, type: :model do
  before do
    @placecode = "011000"
    place = Place.create(code:"011000",name:"北海道稚内")
    @weather = Weather.new(@placecode)
    uri = URI.parse("https://weather.tsukumijima.net/api/forecast?city=#{@placecode}")
    json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
    @result = JSON.parse(json) #返り値をubyの配列に変
  end
  describe '天気予報結果のテスト' do
    it '期待通りに結果がでる1' do
        @url = @result['forecasts'][0]['image']['url']
        expect(@weather.display1).to eq @url
    end
    it '期待通りに結果がでる2' do
        @url = @result['forecasts'][1]['image']['url']
        expect(@weather.display2).to eq @url
    end
    it '期待通りに結果がでる3' do
        @url = @result['forecasts'][2]['image']['url']
        expect(@weather.display3).to eq @url
    end
  end
end
