require 'rails_helper'


RSpec.describe User, type: :model do
  describe "#create" do
    let(:user) { create(:user) }
    it "姓・名・パスワードがあれば有効な状態であること" do
      expect(user).to be_valid
    end
  end

  describe "validates" do
    it "名が未入力の時、無効であること" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "姓が未入力の時、無効であること" do
      user = User.new(first_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "メールアドレスが未入力の時、無効であること" do
      user = User.new(email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "パスワードが未入力の時、無効であること" do
      user = User.new(password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

  end
end
