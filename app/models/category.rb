class Category < ApplicationRecord
  validates :todo_id, presence: true
  validates :category_id, presence: true
    
  enum category_id: { 医療: 1, 自宅: 2, 旅行: 3,プログラム:4,スポーツ:5,他:6 }

  def category_insert(categories,todo_id)
    result = false
    categories.each do |category|
      @category = Category.new(todo_id:todo_id,category_id:category.to_i)
      result = true if @category.save
    end
    result
  end

  def category_select_id(category_id)
    categories = Category.order(:category_id)
    @category_ids = []
    category_id2 = nil
    categories.each do |category|
      if  category.category_id != category_id2
        @category_ids << category.category_id
      end
      category_id2 = category.category_id
    end
    @category_ids
  end  
end
  