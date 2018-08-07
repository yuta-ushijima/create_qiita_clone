require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "#index" do
    it "正常なレスポンスを返すこと" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "#create" do
    it "ユーザー登録ができたとき、ステータスコードが200を返すこと" do
      user_params = FactoryBot.attributes_for(:user)
      post :create, params: {user: user_params}
      expect(response).to have_http_status "200"
    end
  end

  describe "#update" do
    let(:user) { create(:user) }
    it "ユーザー情報の更新ができること" do
      user_params = FactoryBot.attributes_for(:user, first_name: "ジョブズ")
      patch :update, params: { id: user.id, user: user_params}
      expect(user.reload.first_name).to eq("ジョブズ")
    end
  end

  describe "#destory" do
    let(:user) { create(:user)}
    it "指定したidの削除に成功したとき、ステータスコードが204を返すこと" do
      delete :destroy, params: { id: user.id}
      expect(response).to have_http_status "204"
    end
  end
end
