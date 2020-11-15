require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @blog = create(:blog)
  end 
 
  describe 'バリデーション' do
    it '必須項目が入力されていれば、OK' do
      expect(@blog.valid?).to eq(true)
    end
  end
  describe 'バリデーション' do
    it 'タイトルがブランクだとNG' do
      @blog.title=''
      expect(@blog.valid?).to eq(false)
    end
  end
  describe 'バリデーション' do
    it '中身がブランクだとNG' do
      @blog.content=''
      expect(@blog.valid?).to eq(false)
    end
  end
end
