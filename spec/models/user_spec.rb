require 'rails_helper'

RSpec.describe User, type: :model do
 before do
    @user = create(:user) #ここがリファクタリングされてます。
  end

  describe 'バリデーション１' do
    it 'emailとpasswordと名前いずれも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが形式が不正ならNG' do
      @user.email = 'test'
      expect(@user.valid?).to eq(false)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'パスワードが６文字以下ならNG' do
      @user.password = '123'
      expect(@user.valid?).to eq(false)
    end
  end
end