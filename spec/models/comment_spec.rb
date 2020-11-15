  require 'rails_helper'

  RSpec.describe Comment, type: :model do
    before do
      @blog = create(:blog)
      @comment = Comment.create(name:"john",body:"pass",email:"test@example.com",blog_id:1)
    end 
    
    describe 'バリデーション' do
      it '必須項目が入力されていれば、OK' do
        expect(@comment.valid?).to eq(true)
      end
      it '名前が入力されていなければ、NG' do
        @comment.name = ''
        expect(@comment.valid?).to eq(false)
      end
      it '本文が入力されていなければ、NG' do
        @comment.body = ''
        expect(@comment.valid?).to eq(false)
      end
      it '該当ブログがなければエラーとなる' do
        @comment.blog_id = 2
        expect(@comment.valid?).to eq(false)
      end
    end
  end