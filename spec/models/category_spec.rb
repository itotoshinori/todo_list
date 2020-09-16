require 'rails_helper'

RSpec.describe Category, type: :model do
   before do
    @category = Category.new(title:"テスト", todo_id:1,category_id:1)
  end
  describe 'バリデーション' do
    it 'titleとtodo_idとcategory_idいずれも値が設定されていれば、OK' do
      expect(@category.valid?).to eq(true)
    end
  end
  describe 'バリデーション' do
    it 'todo_idがブランクだとNG' do
      @category.todo_id = ''
      expect(@category.valid?).to eq(false)
    end
  end
  describe 'バリデーション' do
    it '中身がブランクだとNG' do
      @category.category_id = ''
      expect(@category.valid?).to eq(false)
    end
  end
end
