require "rails_helper"

RSpec.describe "create user mutation", type: :request do
  let(:context) { {} }
  let(:variables) do
    { "user": {
      "first_name": "hoge",
      "last_name": "fuga",
      "email": "fuga@hoge.com",
      "password": "hogefuga",
    } }
  end
  let(:result) {
    res = QiitaCloneSchema.execute(
      query_string,
      context: context,
      variables: variables,
    )
    # Print any errors
    if res["errors"]
      pp res
    end
    res
  }
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
      expect(result["data"]["createUser"]["first_name"]).to eq "hoge"
      expect(result["data"]["createUser"]["last_name"]).to eq "fuga"
    end
  end
end
