class Types::ArticleType < Types::BaseObject
  field :id, ID, null: false
  field :title, String, null: true
  field :body, String, null: true
  field :created_at, Types::DateTimeType, null: false, camelize: false
  field :updated_at, Types::DateTimeType, null: false, camelize: false
  # articleからみて、userは1:1なので、これで参照
  # field :user, Types::UserType, null: true
end
