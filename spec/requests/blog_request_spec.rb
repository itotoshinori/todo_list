require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  before do
    @blog = create(:blog)
  end
  describe "#index" do
    # 正常にレスポンスを返すこと
    it "responds successfully" do
     get blogs_url
     expect(response.status).to eq 200
     #expect(response.title).to eq "テスト"
    end
    it "showが成功すること" do
      get blogs_url  @blog.id
      expect(response.status).to eq 200
    end
  end
end

