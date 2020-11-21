require 'rails_helper'

RSpec.describe Portal, type: :model do
  before do
      @portal = Portal.create(title:"テスト",content:"入力テスト")
    end 
    
    describe 'バリデーション確認' do
      it '必須項目が入力されていれば、OK' do
        expect(@portal.valid?).to eq(true)
      end
      it 'タイトルが入力されていなければ、NG' do
        @portal.title = ''
        expect(@portal.valid?).to eq(false)
      end
      it '本文が入力されていなければ、NG' do
        @portal.content = ''
        expect(@portal.valid?).to eq(false)
      end
    end
end
