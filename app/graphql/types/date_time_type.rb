class Types::DateTimeType < Types::BaseObject
  graphql_name "DateTimeType"

  def coerce_input(value, context)
    Time.zone.parse(value)
  end

  def coerce_result(value, context)
    I18n.l(value, format: :default)
  end
end
