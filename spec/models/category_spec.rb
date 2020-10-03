require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = Category.new(todo_id:21,category_id:"医療")
  end
  describe 'バリデーション' do
    it 'todo_idとcategory_idいずれも値が設定されていれば、OK' do
      expect(@category.valid?).to eq(false)
    end
  end
  describe 'バリデーション' do
    it 'todo_idがブランクだとNG' do
      @category.todo_id = ''
      expect(@category.valid?).to eq(false)
    end
  end
end
