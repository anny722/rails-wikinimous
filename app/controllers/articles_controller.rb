class ArticlesController < ApplicationController
  before_action :let_article, only: %i[show edit update destroy]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params_permited)
    @article.save
    redirect_to(@article, alert: 'Article was successfully created')
  end

  def edit
  end

  def update
    @article.update(params_permited)
    redirect_to(@article, alert: 'Article was successfully updated')
  end

  def destroy
    @article.destroy
    redirect_to(articles_path, alert: 'Article was successfully deleted')
  end

  private

  def let_article
    @article = Article.find(params[:id])
  end

  def params_permited
    params.require(:article).permit(:title, :content)
  end
end
