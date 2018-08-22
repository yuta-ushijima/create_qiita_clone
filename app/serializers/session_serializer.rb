require 'base64'

class SessionSerializer < ActiveModel::Serializer
  attributes :email, :token_type, :access_token

  def user_id
    Base64.encode64(object.id.to_s)
  end

  def token_type
    # Authorization ヘッダのBearerスキーム
    'Bearer'
  end
end
