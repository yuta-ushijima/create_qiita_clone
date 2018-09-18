class Mutations::CreateUser < GraphQL::Schema::Mutation
  null true

  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :email, String, required: false
  argument :password, String, required: false
  argument :password_confirmation, String, required: false

  def resolve(first_name:, last_name:, email:, password:, password_confirmation:)
    User.create! first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation
  end
end
