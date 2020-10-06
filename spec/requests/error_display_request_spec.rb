require 'rails_helper'

RSpec.describe "ErrorDisplays", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/error_display/index"
      expect(response).to have_http_status(:success)
    end
  end

end
