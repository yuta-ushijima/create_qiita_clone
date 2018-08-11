require 'rails_helper'

RSpec.describe Article, type: :model do
  describe "validates" do
    let(:article) { create(:article) }
    it "タイトルが空であるとき、無効であること" do
      article= Article.new(title: nil)
      article.valid?
      expect(article.errors[:title]).to include("を入力してください。")
    end

    it "本文が空であるとき、無効であること" do
      article= Article.new(body: nil)
      article.valid?
      expect(article.errors[:body]).to include("を入力してください。")
    end
  end
end