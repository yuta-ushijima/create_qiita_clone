require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe "#index" do
    let(:article) { create(:ruby) }
    let(:user) { create(:user)}
    it "記事一覧のレスポンスが取得できること" do
      get :index
      expect(response).to  have_http_status 200
    end

    it "記事一覧の中身が正しく取得できること"do
      get :index
      expect(response.body).to include("")
    end
  end
end