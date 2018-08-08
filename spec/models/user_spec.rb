require 'rails_helper'


RSpec.describe User, type: :model do
  describe "#create" do
    let(:user) { create(:user) }
    it "姓・名・パスワードがあれば有効な状態であること" do
      expect(user).to be_valid
    end
  end

  describe "" do

  end
end
