class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include AbstractController::Translation
  include ErrorHandler
  before_action :authenticate_user!
end
