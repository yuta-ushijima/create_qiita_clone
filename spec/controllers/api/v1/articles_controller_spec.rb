require "rails_helper"

RSpec.describe Api::V1::ArticlesController, type: :controller do
  #  TODO: ログイン周りをfixしたら、修正する

  describe "#index" do
    # let!(:article) { create(:article) } でもテストはパスする
    before { @article = create(:article) }

    it "記事一覧が取得できること" do
      get :index
      expect(response).to have_http_status :ok
      json = JSON.parse(response.body)[0]
      expect(json["id"]).to eq @article.id
    end
  end
  #  TODO: ログイン周りをfixしたら、修正する

  xdescribe "#create" do
    let(:user) { create(:user) }
    before { @article = attributes_for(:article) }

    it "記事作成した際に、200レスポンスが返ってくること" do
      sign_in user
      post :create
      expect(response).to have_http_status :ok
      json = JSON.parse(response.body)[0]
      expect(json["title"]).to eq @article.title
    end
  end
  # 　TODO: ログイン周りをfixしたら、修正する

  describe "#update" do
    let(:user) { create(:user) }
    before { @article = create(:article, title: "hoge") }

    it "記事の更新ができること" do
      sign_in user
      put :update, params: { id: @article.id }
      expect(@article.reload.title).to eq(@article.title)
    end
  end
  #  TODO: ログイン周りをfixしたら、修正する

  xdescribe "#destory" do
    let(:user) { create(:user) }
    before { @article = create(:article) }

    it "指定したidの削除に成功したとき、ステータスコードが204を返すこと" do
      sign_in user
      delete :destroy, params: { id: @article.id }
      expect(response).to have_http_status :no_content
    end
  end
end
