class Resolvers::CreateArticle < GraphQL::Function
  argument :title, !types.String
  argument :body, !types.String
  argument :user_id, types.Int

  type Types::ArticleType

  def call(_obj, args, _ctx)
    Article.create!(
      title: args[:title],
      body: args[:body],
      user_id: args[:user_id],
    )
  end
end
