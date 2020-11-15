require 'rails_helper'

RSpec.describe Account, type: :model do
  before do
    @todo = create(:todo)
    @account = create(:account)
  end 
  
  describe 'バリデーション' do
    it '必須項目が入力されていれば、OK' do
      expect(@account.valid?).to eq(true)
    end
    it '該当のtodoデータがないと、NG' do
      @account.todo_id = 2
      expect(@account.valid?).to eq(false)
    end
    it '出費額が登録されてなければ、NG' do
      @account.amount = nil
      expect(@account.valid?).to eq(false)
    end
  end
  describe '他のモデルから会計登録する時のメソッド登録' do
    it '必須項目が登録されていれば登録されることを確認' do
      @todo.item = 2
      @todo.itemmoney = 300
      @todo.remark = "テスト"
      @account = Account.new
      @accountcreate = @account.accountcreate(2020-11-30,@todo)
      expect(@accountcreate).to eq true
    end
  end  
end

