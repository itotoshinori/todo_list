require 'rails_helper'

RSpec.describe "Portals", type: :request do
  before do
    @portal = create(:portal)
  end
  describe "#index" do
    # 正常にレスポンスを返すこと
    it "not_login responds successfully" do
     get portals_url
     expect(response.status).to eq 200
     #expect(response.title).to eq "テスト"
    end
  end
end

