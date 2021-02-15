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


  def article_params
    params.permit(:title, :body)
  end
end
