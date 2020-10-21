require 'rails_helper'

RSpec.describe "Totalizations", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/totalizations/index"
      expect(response).to have_http_status(:success)
    end
  end

end
