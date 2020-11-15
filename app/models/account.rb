class Account < ApplicationRecord
    belongs_to :todo
    attr_accessor :deletecheck
    validates :amount, presence: true
    #todo＿controllerで会計もまとめて新規登録するメソッド
    def accountcreate(today,todo)
        @account = Account.new(todo_id:todo.id,item:todo.item,amount:todo.itemmoney,remark:todo.remark,expense:false,registrationdate:today)
        if @account.save
            result = true
        else
            result = false 
        end
    end
end
