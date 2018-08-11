class Api::V1::ArticlesController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  def index
    @articles = Article.all.includes(:article)
    render json: @articles
  end

  def create
    @article = Article.new(article_params)
    if @article.save!
      render json: @article, serializer: ArticleSerializer, status: 200
    else
      render json: @article, status: 400
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.present?
      @article.update(article_params)
      render json: @article, serializer: ArticleSerializer, status: 200
    else
      render json: @article, serializer: ArticleSerializer, status: 400
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    render json: @article, serializer: ArticleSerializer, status: 204
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :user_id)
    end
end
