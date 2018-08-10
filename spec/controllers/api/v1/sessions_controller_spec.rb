require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe "#create" do
    let(:user) { create(:user) }
    it "登録されているユーザーがログインできること" do
      sign_in user
      get :create
      expect(response).to have_http_status 200
    end
  end

  describe "#logout" do
    let(:user) { create(:user) }
    it "ログインしているユーザーがログアウトできること" do
      sign_in user
      delete :destroy, params: { user: user}
      expect(response).to have_http_status 202
    end
  end

end
