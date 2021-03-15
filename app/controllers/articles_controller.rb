class ArticlesController < ApplicationController
  before_action :login_required, except: %i[index show]

  def index
    @pagy, @articles = if current_user
                         pagy(Article.includes(:user).where(status: 'publish').or(current_user.articles))
                       else
                         pagy(Article.includes(:user).publish)
                       end
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to articles_path, success: '投稿しました'
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path, success: '編集しました'
    else
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to articles_path, success: '投稿を削除しました。'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
