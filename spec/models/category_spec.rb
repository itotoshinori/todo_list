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
  describe 'カテゴリ作成時配列確認' do
    before do
     @category = Category.new
    end
    it 'カテゴリに入力があれば上から順に配列化される' do
      @todo.category_id = 1
      @todo.category_id2 = 2
      @todo.category_id3 = 3
      @categoryarray = @category.category_array(@todo)
      expect(@categoryarray[0]).to eq 1
      expect(@categoryarray[1]).to eq 2
      expect(@categoryarray[2]).to eq 3
    end
    it 'カテゴリに入力があれば上から順に配列化される' do
      @todo.category_id2 = 2
      @categoryarray = @category.category_array(@todo)
      expect(@categoryarray[0]).to eq 2
    end
    it 'カテゴリに入力があれば上から順に配列化される' do
      @todo.category_id3 = 3
      @categoryarray = @category.category_array(@todo)
      expect(@categoryarray[0]).to eq 3
    end
    it 'categoryinsertのテスト' do
      @todo.category_id = 1
      @categoryarray = @category.category_array(@todo)
      @categoryinsert = @category.category_insert(@categoryarray,1)
      expect(@categoryinsert).to eq true
    end
  end

  describe '更新メソッドのテスト' do
    before do
      @id = 1
      @category_ids = Category.where(todo_id:@id)  
    end
    it 'categoryupdateのテスト　引数が3つともブランクだったらデータをなしにする' do
      @category = @category.category_update(@category_ids,"","","",@id)
      @category_ids = Category.where(todo_id:1)
      expect(@category_ids.blank?).to eq(true)
    end

    it 'categoryupdateのテスト　引数が２つしかなければ２個のデータを作成' do
      @category = @category.category_update(@category_ids,4,"","",@id)
      @category_ids = Category.where(todo_id:@id)
      expect(@category_ids.find(1).category_id).to eq "プログラム"
      expect(@category_ids.exists?(2)).to eq(false)
      expect(@category_ids.exists?(3)).to eq(false)
    end
    it 'categoryupdateのテスト　引数が２つしかなければ２個のデータを作成' do
      @category = @category.category_update(@category_ids,4,1,"",@id)
      @category_ids = Category.where(todo_id:@id)
      expect(@category_ids.find(1).category_id).to eq "プログラム"
      expect(@category_ids.find(2).category_id).to eq "医療"
      expect(@category_ids.exists?(3)).to eq(false)
    end
    it 'categoryupdateのテスト　引数が3つあれば3個のデータ(最大)を作成' do
      @category = @category.category_update(@category_ids,4,1,12,@id)
      @category_ids = Category.where(todo_id:@id)
      expect(@category_ids.find(1).category_id).to eq "プログラム"
      expect(@category_ids.find(2).category_id).to eq "医療"
      expect(@category_ids.find(3).category_id).to eq "ブックマーク"
    end
  end
end
