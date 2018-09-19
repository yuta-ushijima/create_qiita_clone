require "rails_helper"

RSpec.describe "create user mutation", type: :request do
  let(:context) { {} }
  let(:user_params) { attributes_for(:user) }
  let(:variables) do
    { "user": user_params }
  end
  let(:result) { prepare_graphql_arg(query_string: query_string, variables: variables) }
  describe "ユーザーの作成" do
    let(:query_string) do
      %|mutation createUser($user:UserInputType!) {
          createUser(user: $user) {
            id
            first_name
            last_name
          }
        }
      |
    end
    it "作成したユーザーデータが取得できること" do
      result
      # TODO: user.idが+1になってしまう問題の解消と、できればFactoryBotでやりたい
      # expect(result["data"]["createUser"]["id"]).to eq user.id.to_s
      expect(result["data"]["createUser"]["first_name"]).to eq user_params[:first_name]
      expect(result["data"]["createUser"]["last_name"]).to eq user_params[:last_name]
    end
  end
end
