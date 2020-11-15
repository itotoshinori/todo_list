require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = Item.create(name:"食費")
  end
  describe '必須項目バリデーション確認' do
    it '必須項目が入力されていれば OK' do
      expect(@item.valid?).to eq(true)
    end
  end
end
