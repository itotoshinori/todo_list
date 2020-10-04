class Category < ApplicationRecord
  belongs_to :todo
  validates :todo_id, presence: true
  validates :category_id, presence: true
    
  enum category_id: { 医療: 1, 薬: 2, 検査結果: 3,プログラム:4,映画・テレビ:5,自宅:6,税金等支払:7, スポーツ: 8, 旅行:9,保険等:10,契約書:11,ブックマーク:12 }

  def category_insert(categories,todo_id)
    result = false
    categories.each do |category|
      @category = Category.new(todo_id:todo_id,category_id:category.to_i)
      result = true if @category.save
    end
    result
  end
end
  