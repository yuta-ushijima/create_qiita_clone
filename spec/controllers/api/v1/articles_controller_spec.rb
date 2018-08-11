require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  describe "#index" do
    let(:article) { create(:article) }
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

  describe "#create" do
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    it "記事作成した際に、200レスポンスが返ってくること" do
      article_params = FactoryBot.attributes_for(:article, user_id: user.id)
      post :create, params: {article: article_params}
      expect(response).to have_http_status 200
    end
  end

  describe "#update" do
    let(:article) { create(:article) }
    it "記事の更新ができること" do
      article_params = FactoryBot.attributes_for(:article)
      patch :update, params: {id: article.id, article: article_params}
      expect(article.reload.title).to eq(article.title)
    end
  end

  describe "#destory" do
    let(:article) { create(:article) }
    it "指定したidの削除に成功したとき、ステータスコードが204を返すこと" do
      delete :destroy, params: { id: article.id}
      expect(response).to have_http_status "204"
    end
  end
end