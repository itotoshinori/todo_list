require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @todo = create(:todo)
    @category = create(:category)
  end
  describe 'バリデーション' do
    it 'todo_idとcategory_idいずれも値が設定されていれば、OK' do
      expect(@category.valid?).to eq(true)
    end
    it 'todo_idがブランクならば、NG' do
      @category.todo_id = ''
      expect(@category.valid?).to eq(false)
    end
    it 'category_idがブランクならば、NG' do
      @category.category_id = ''
      expect(@category.valid?).to eq(false)
    end
  end
end
