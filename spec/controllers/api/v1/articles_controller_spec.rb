require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :request do

  describe "#index" do
    let!(:article) { create(:article) }
    it "記事一覧が取得できること" do
      get api_v1_articles_url
      expect(response).to have_http_status 200
      json = JSON.parse(response.body)[0]
      expect(json["id"]).to eq article.id
    end
  end
end