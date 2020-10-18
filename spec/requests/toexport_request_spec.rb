require 'rails_helper'

RSpec.describe "Toexports", type: :request do

  describe "GET /condition" do
    it "returns http success" do
      get "/toexport/condition"
      expect(response).to have_http_status(:success)
    end
  end

end
