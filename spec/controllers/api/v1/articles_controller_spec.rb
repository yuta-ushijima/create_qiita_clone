require "rails_helper"

RSpec.describe Api::V1::ArticlesController, type: :request do
  #  TODO: ログイン周りをfixしたら、修正する

  xdescribe "#index" do
    # let!(:article) { create(:article) } でもテストはパスする
    before { @article = create(:article) }

    it "記事一覧が取得できること" do
      get api_v1_articles_url
      expect(response).to have_http_status :ok
      json = JSON.parse(response.body)[0]
      expect(json["id"]).to eq @article.id
    end
  end
  #  TODO: ログイン周りをfixしたら、修正する

  xdescribe "#create" do
    before { @article = attributes_for(:article) }

    it "記事作成した際に、200レスポンスが返ってくること" do
      post api_v1_articles_url
      expect(response).to have_http_status :ok
      json = JSON.parse(response.body)[0]
      expect(json["title"]).to eq @article.title
    end
  end
  # 　TODO: ログイン周りをfixしたら、修正する

  xdescribe "#update" do
    before { @article = attributes_for(:article, title: "hoge") }

    it "記事の更新ができること" do
      put api_v1_article_url, params: { id: @article.id }
      expect(@article.reload.title).to eq(@article.title)
    end
  end
  #  TODO: ログイン周りをfixしたら、修正する

  xdescribe "#destory" do
    before { @article = attributes_for(:article) }

    it "指定したidの削除に成功したとき、ステータスコードが204を返すこと" do
      delete api_v1_article_url, params: { id: @article.id }
      expect(response).to have_http_status "204"
    end
  end
end
