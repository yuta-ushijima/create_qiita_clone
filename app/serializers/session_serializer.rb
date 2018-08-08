class SessionSerializer < ActiveModel::Serializer
  attributes :email, :token_type, :user_id, :access_token, :password

  def user_id
    object.id
  end

  def token_type
    # Authorization ヘッダのBearerスキーム
    'Bearer'
  end
end
