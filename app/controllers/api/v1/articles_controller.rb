class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  def index
    @articles = Article.all
    render json: @articles
  end
end
