  require 'rails_helper'

  RSpec.describe Comment, type: :model do
    before do
      @comment = Comment.new(name:"john",body:"pass",email:"test@example.com",blog_id:1)
    end 
    
    describe 'バリデーション' do
      it '必須項目が入力されていれば、OK' do
        expect(@comment.valid?).to eq(false)
      end
    end
  end