require "rails_helper"

RSpec.describe Api::V1::SessionsController, type: :controller do
  describe "#create" do
    let(:user) { create(:user) }
    it "登録されているユーザーがログインできること" do
      post :create, params: { email: user.email, password: user.password }
      expect(response).to have_http_status :ok
      json = JSON.parse(response.body)
      aggregate_failures do
        expect(json["email"]).to eq user.email
        expect(json["token_type"]).to eq "Bearer"
        expect(json["access_token"]).to eq user.access_token
      end
    end
  end

  describe "#logout" do
    let(:user) { create(:user) }
    it "ログインしているユーザーがログアウトできること" do
      sign_in user
      delete :destroy, params: { user: user }
      expect(response).to have_http_status :accepted
    end
  end
end
