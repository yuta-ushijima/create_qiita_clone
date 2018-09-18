class Types::UserInputType < GraphQL::Schema::InputObject
  graphql_name "UserInputType"
  description "All the attributes for creating a user"

  argument :id, ID, required: false
  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :email, String, required: false
  argument :password, String, required: false
  argument :password_confirmation, String, required: false
end
