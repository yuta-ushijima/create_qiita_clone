module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
                               description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :user, Types::UserType, null: true, description: "ユーザー" do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :article, Types::ArticleType, null: true, description: "記事" do
      argument :id, ID, required: true
    end

    def article(id:)
      Article.find(id)
    end
  end
  #
  # field :allArticles, !types[Types::ArticleType] do
  #   resolve ->(_obj, _args, _ctx) { Article.all }
  # end
end
