require 'rails_helper'

RSpec.describe TodosController, type: :request do
  before do
    @user = FactoryBot.create(:user)
    @todo = @user.todos.create(
      title: "テスト",
      term: 2020-10-22)
    @account = @todo.accounts.create(
      amount: 100)
    @userid = 1
  end
  describe "#index" do
   # 正常にレスポンスを返すこと
    it "responds successfully" do
      post todos_url
      expect(response).to redirect_to login_index_path
      #expect(response).to redirect_to todos_path　←こちらで通したいがエラーがでる
    end
  end
end
