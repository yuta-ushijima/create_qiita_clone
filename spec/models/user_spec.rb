require "rails_helper"

RSpec.describe User, type: :model do
  describe "#create" do
    let(:user) { create(:user) }
    it "姓/名email/パスワードがあれば有効な状態であること" do
      expect(user).to be_valid
    end
  end

  describe "validates" do
    let(:user) { create(:user) }
    it "名が未入力の時、無効であること" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください。")
    end

    it "姓が未入力の時、無効であること" do
      user = User.new(last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください。")
    end

    it "メールアドレスが未入力の時、無効であること" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "メールアドレスが半角英数以外の時、無効であること" do
      user = User.new(email: "アイウエオ")
      user.valid?
      expect(user.errors[:email]).to include("無効な値です。")
    end

    it "パスワードが未入力の時、無効であること" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end

    it "パスワードが6文字以下の時、無効であること" do
      user = User.new(password: "a" * 5)
      user.valid?
      expect(user.errors[:password]).to include("が短すぎます。")
    end
  end
end
