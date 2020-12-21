require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @userid = 1
    cookies[:userid] = {:value => @userid, :expires => 5.days.from_now }
  end
  describe "#cokkie" do
    # 正常にレスポンスを返すこと
    it "cookie success" do
     #get users_url
     #expect(response.status).to eq 200
     #expect(response.cookies[:userid]).to eq 1
    end
  end
end

