module GraphqlHelper
  def prepare_graphql_arg(query_string:, variables:, context: {})
    QiitaCloneSchema.execute(
      query_string,
      variables: variables,
      context: context,
    )
  end
end
