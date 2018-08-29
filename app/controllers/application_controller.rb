class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include AbstractController::Translation
  before_action :authenticate_user!
end
