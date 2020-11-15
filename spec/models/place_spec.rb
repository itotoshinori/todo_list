require 'rails_helper'

RSpec.describe Place, type: :model do
  before do
    @place = create(:place) 
  end
  describe '必須項目バリデーション確認' do
    it '必須項目が入力されていれば OK' do
      expect(@place.valid?).to eq(true)
    end

    it 'placecodeが空欄だったら NG' do
      @place.code = ''
      expect(@place.valid?).to eq(false)
    end

    it 'place名が空欄だったら NG' do
      @place.name = ''
      expect(@place.valid?).to eq(false)
    end

    it 'placecodeがダブっていたら NG' do
      @place2 = Place.create(code:"1",name:"大阪")
      expect(@place2.valid?).to eq(false)
    end
  end
end
