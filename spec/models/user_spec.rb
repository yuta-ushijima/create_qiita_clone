require 'rails_helper'


RSpec.describe User, type: :model do
  describe "#create" do
    it "姓・名・パスワードがあれば有効な状態であること" do
      user = User.new(
        first_name: "山田",
        last_name:  "太郎",
        password: "hogehoge",
        password_confirm: "hogehoge")
      expect(user).to be_valid
    end
  end
end
