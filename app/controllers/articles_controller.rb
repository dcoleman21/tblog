class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.save!
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)

    article.save

    redirect_to "/articles/#{article.id}"
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to articles_path
  end

  private

  def article_params
    params.permit(:title, :body)
  end
end
