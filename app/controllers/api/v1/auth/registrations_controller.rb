class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :authenticate_user!

  private

    def sign_up_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:full_name, :email)
    end
end
