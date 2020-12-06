require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @todo = @user.todos.create(
      title: "コロナ対策",
      term: 2020-10-22,
      )
  end
  describe "#index" do
   # 正常にレスポンスを返すこと
   it "responds successfully" do
    get :index
    expect(response).to have_http_status(302)
   end
 end
end




