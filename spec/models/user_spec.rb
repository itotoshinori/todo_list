require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#user" do
    context "nameが空の場合" do
      let(:user){User.new(name:"")} #nameが空文字のUserオブジェクトを生成
      it "エラーを返す" do
        user.valid? #バリデーションを実行
        expect(user.errors[:name]).to be_present #期待結果：エラーメッセージが存在する
      end
      let(:user){User.new(email:"")} #emailが空文字のUserオブジェクトを生成
      it "エラーを返す" do
        user.valid? #バリデーションを実行
        expect(user.errors[:email]).to be_present #期待結果：エラーメッセージが存在する
      end
    end

    context "メールアドレス形式じゃない時の確認" do
      let(:user){User.new(email:"abc")} 
      it "エラーを返す" do
        user.valid? #バリデーションを実行
        expect(user.errors[:email]).to be_present #期待結果：エラーメッセージが存在する
      end
    end

    context "メールアドレス形式の場合はエラーを返さない" do
      let(:user){User.new(email:"abc@gmail.com")} 
      it "エラーを返さない" do
        user.valid? #バリデーションを実行
        expect(user.errors[:email]).to be_blank #期待結果：エラーメッセージが存在する
      end
    end

    context "パスワード長さ確認" do
      let(:user){User.new(password:"a" * 5)} 
      it "エラーを返す" do
        user.valid? #バリデーションを実行
        expect(user.errors[:password]).to be_present #期待結果：エラーメッセージが存在する
      end
    end

    context "名前長さ確認" do
      let(:user){User.new(name:"a" * 15)} 
      it "エラーを返す" do
        user.valid? #バリデーションを実行
        expect(user.errors[:name]).to be_present #期待結果：エラーメッセージが存在する
      end
    end
  end
end
