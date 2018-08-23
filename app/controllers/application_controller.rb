class ApplicationController < ActionController::API
  include AbstractController::Translation

  before_action :authenticate_user_from_token!

  respond_to :json

  def authenticate_user_from_token!
    auth_token = request.headers["Authorization"]

    if auth_token
      # ヘッダーで受け取ったトークンとDBのaccess_tokenを照合
      authenticate_with_auth_token(auth_token)
    else
      authenticate_error
    end
  end

  # FIXME: Devise の実装が完了したのちに削除すること
  def current_user
    session[:current_user_id] ||= 1
    @current_user ||= User.find(session[:current_user_id])
  end

  private

    def authenticate_with_auth_token(auth_token)
      unless auth_token.include(":")
        authenticate_error
        return
      end

      user_id = auth_token.split(":").first
      user = User.where(id: user_id).first

      if user && Devise.secure_compare(user.access_token, auth_token)
        # ログインしてもセッション内にユーザー情報を保存しない
        sign_in user, store: false
      else
        authenticate_error
      end
    end

    # 認証に失敗した際に401のエラーを返す
    def authenticate_error
      render json: { error: t("devise.failure.unauthenticated") }, status: 401
    end
end
