require "rails_helper"
# TODO: 正常系と異常系のspecを作る
RSpec.describe Api::V1::SessionsController, type: :controller do
  xdescribe "#create" do
    let(:user) { create(:user) }
    it "登録されているユーザーがログインできること" do
      post "api/v1/auth/sign_in", params: { email: user.email, password: user.password }
      expect(response).to have_http_status :ok
      json = JSON.parse(response.body)
      aggregate_failures do
        expect(json["email"]).to eq user.email
        expect(json["token_type"]).to eq "Bearer"
        expect(json["access_token"]).to eq user.access_token
      end
    end
  end

  xdescribe "#logout" do
    let(:user) { create(:user) }
    it "ログインしているユーザーがログアウトできること" do
      sign_in user
      delete :destroy, params: { email: user.email }
      expect(response).to have_http_status :accepted
    end
  end
end
