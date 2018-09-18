RSpec.describe Types::UserType do
  describe "UserType" do
    subject { Types::UserType.fields.keys }

    context "Check UserType fields" do
      it "UserTypeに指定したkeyが含まれていること" do
        expect(subject).to include("id", "first_name", "last_name")
      end
    end
  end
end
