require 'rails_helper'

RSpec.describe TodosController, type: :request do
  before do
    @user = FactoryBot.create(:user)
    @todo = @user.todos.create(
      title: "買い物",
      term: 2020-10-22)
    @account = @todo.accounts.create(
      amount: 100)
  end

  describe "#index" do
    # ログインしてなければログイン画面に遷移する
    it "未ログイン時　responds successfully" do
      cookies[:userid] = nil
      post todos_path
      expect(response).to redirect_to login_index_path
    end
   # ログインしていれば、/todosに遷移すること
    it "responds successfully" do
      cookies[:userid] = "1" #自作ログインメソッドでこれでログイン状態にはなる模様
      post todos_path
      expect(response).to redirect_to todos_path #←こちらをexamples（緑）で通したいがfailures（赤）がでる
    end
  end
end
