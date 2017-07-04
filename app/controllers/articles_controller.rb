class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit]
  before_filter :authorize

  def index
    @articles = Article.all
  end

  def show          # GET /articles/:id
    # @article = Article.find(params[:id])
  end

  def new           # GET /articles/new
    @article = Article.new
  end

  def create        # POST /articles
    # @article = article.create!(params[:name])
    @article = Article.create(article_params)
    redirect_to articles_path
  end

  def edit          # GET /articles/:id/edit
    # @article = Article.find(params[:id])
  end

  def update        # PATCH /articles/:id
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy       # DELETE /articles/:id
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
