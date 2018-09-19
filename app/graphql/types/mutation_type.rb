class Types::MutationType < Types::BaseObject
  field :create_user, Types::UserType, null: true, description: "Create User" do
    argument :user, Types::UserInputType, required: true
  end

  def create_user(user:)
    User.create! user.to_h
  end

  field :update_user, Boolean, null: false, description: "Update a user" do
    argument :user, Types::UserInputType, required: true
  end

  def update_user(user:)
    existing = User.where(id: user[:id]).first
    existing&.update user.to_h
  end

  field :delete_user, Boolean, null: false, description: "Delete a user" do
    argument :id, ID, required: true
  end

  def delete_user(id:)
    User.where(id: id).destroy_all
  end
end
