require "rails_helper"

RSpec.describe "create user mutation", type: :request do
  subject { post "/api/v1/graphql", params: params }

  let(:params) { { query: query, variables: variables } }
  let(:query) do
    %|mutation createUser($user:UserInputType!) {
        createUser(user: $user) {
          id
          first_name
          last_name
        }
      }
    |
  end

  let(:variables) { { "user": user_params } }
  let(:user_params) { attributes_for(:user) }

  it "作成したユーザーデータが取得できること" do
    subject
    json = JSON.parse(response.body)
    aggregate_failures do
      expect(json["data"]["createUser"]["id"]).not_to be_nil
      expect(json["data"]["createUser"]["first_name"]).to eq user_params[:first_name]
      expect(json["data"]["createUser"]["last_name"]).to eq user_params[:last_name]
    end
  end
end
