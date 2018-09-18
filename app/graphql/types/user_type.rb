class Types::UserType < Types::BaseObject
  graphql_name "UserType"
  field :id, ID, null: false
  field :first_name, String, null: false, camelize: false
  field :last_name, String, null: false, camelize: false
  field :created_at, Types::DateTimeType, null: false, camelize: false
  field :updated_at, Types::DateTimeType, null: false, camelize: false
  field :email, String, null: false
  field :encrypted_password, String, null: false, camelize: false
  field :reset_password_token, String, null: true, camelize: false
  field :reset_password_sent_at, Types::DateTimeType, null: true, camelize: false
  field :remember_created_at, Types::DateTimeType, null: true, camelize: false
  field :sign_in_count, Int, null: true, camelize: false
  field :current_sign_in_at, Types::DateTimeType, null: true, camelize: false
  field :last_sign_in_at, Types::DateTimeType, null: true, camelize: false
  field :current_sign_in_ip, String, null: true, camelize: false
  field :last_sign_in_ip, String, null: true, camelize: false
  field :access_token, String, null: true, camelize: false
  field :provider, String, null: false
  field :uid, String, null: false
  field :allow_password_change, Boolean, null: true, camelize: false
  field :image, String, null: true
  field :tokens, String, null: true
  # userからみて、articleは1:Nなので、これで参照
  field :articles, Types::ArticleType.connection_type, null: true
end
