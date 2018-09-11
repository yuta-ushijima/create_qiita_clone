# == Schema Information
#
# Table name: articles
#
#  id         :bigint(8)        not null, primary key
#  body       :text(65535)
#  title      :string(255)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :string(255)
#

require "rails_helper"

RSpec.describe Article, type: :model do
  describe "validates" do
    # TODO: 適切な Error コードが返ることをテストしたspecにリファクタリングする
    it "タイトルが空であるとき、無効であること" do
      article = Article.new(title: nil)
      article.valid?
      expect(article.errors[:title]).to include("を入力してください。")
    end

    # TODO: 適切な Error コードが返ることをテストしたspecにリファクタリングする
    it "本文が空であるとき、無効であること" do
      article = Article.new(body: nil)
      article.valid?
      expect(article.errors[:title]).to include("を入力してください。")
    end
  end
end
