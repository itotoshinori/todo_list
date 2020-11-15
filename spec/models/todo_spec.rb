require 'rails_helper'

RSpec.describe Todo, type: :model do
  before do
    #@user = create(:user)
    @todo = create(:todo) 
  end
  describe '必須項目バリデーション確認' do
    it '必須項目が入力されていれば OK' do
      expect(@todo.valid?).to eq(true)
    end

    it 'タイトルが空欄だったら NG' do
      @todo.title = ''
      expect(@todo.valid?).to eq(false)
    end

    it '期限が空欄だったら NG' do
      @todo.term = ''
      expect(@todo.valid?).to eq(false)
    end

    it 'user_idが空欄だったら NG' do
      @todo.user_id = ''
      expect(@todo.valid?).to eq(false)
    end
  end
end
