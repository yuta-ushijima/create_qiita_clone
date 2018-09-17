require "rails_helper"
RSpec.describe Api::V1::Auth::RegistrationsController, type: :request do
  describe "#create" do
    let(:user_params) { attributes_for(:user) }
    it "登録されているユーザーがログインできること" do
      post "/api/v1/auth",
           params: {
             first_name: user_params[:first_name],
             last_name: user_params[:last_name],
             email: user_params[:email],
             password: user_params[:password],
           }
      expect(response).to have_http_status :ok
      json = JSON.parse(response.body)["data"]
      aggregate_failures do
        expect(json["email"]).to eq user_params[:email]
        expect(json["access_token"]).to eq user_params[:access_token]
        expect(json["uid"]).not_to be_nil
      end
    end
  end
end
