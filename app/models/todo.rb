class Todo < ApplicationRecord
    validates :title, presence: true
    attr_accessor :starttimehour
    attr_accessor :starttimemin
    attr_accessor :item
    attr_accessor :itemmoney
    attr_accessor :remark
    attr_accessor :category_id
    attr_accessor :category_id2
    attr_accessor :category_id3
    has_many :accounts, dependent: :destroy
    has_many :categories, dependent: :destroy

    def todo_delete_target(term, user_id)
        todos = Todo.where('body = ?  and term <= ? and user_id = ?', "", term, user_id).where.not(finishday: nil).where(starttime: nil).order(:term)
        targets =  Array.new()
        todos.each do | todo |
            if Account.where(todo_id:todo.id).blank?  
                if Category.where(todo_id:todo.id).blank?
                    targets.push([todo.id,todo.title,todo.term])
                end 
            end
        end
        targets   
    end
end
