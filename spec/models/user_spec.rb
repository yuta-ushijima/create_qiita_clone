# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  access_token           :string(255)
#  provider               :string(255)      default("email"), not null
#  uid                    :string(255)      default(""), not null
#  allow_password_change  :boolean          default(FALSE)
#  image                  :string(255)
#  tokens                 :text(65535)
#

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
