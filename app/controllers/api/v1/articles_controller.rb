class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_article, only: [:update, :destroy]

  def index
    @articles = Article.active.order("created_at desc")
    render json: @articles
  end

  def show
    @article = Article.active.find(params[:id])
    render json: @article
  end

  def create
    @article = current_user.articles.create!(article_params)
    render json: @article, serializer: ArticleSerializer
  end

  def update
    @article.update!(article_params)
    render json: @article, serializer: ArticleSerializer
  end

  def destroy
    @article.destroy!
    render json: @article, serializer: ArticleSerializer
    head :no_content
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

    def set_article
      @article = current_user.articles.find(params[:id])
    end
end
