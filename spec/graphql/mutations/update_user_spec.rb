require "rails_helper"

RSpec.describe "update user mutation", type: :request do
  subject { post "/api/v1/graphql", params: params }

  let(:params) { { query: query, variables: variables } }
  let(:query) do
    %|mutation updateUser($user:UserInputType!) {
        updateUser(user: $user) {
          id
          first_name
          last_name
        }
      }
    |
  end
  let(:user) { create(:user) }

  let(:variables) { { "user": user_params } }
  let(:user_params) { { id: user.id, first_name: "test" } }

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
