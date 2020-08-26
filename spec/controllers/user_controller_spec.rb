require 'rails_helper'

RSpec.describe UserController, type: :controller do
    describe 'GET #index' do
        it 'リクエストが成功すること' do
            get :index
            expect(response.status).to eq 302
        end
    end
end
