class Web::Moderation::ArticlesController < Web::ApplicationController
  def index
    @q = Article.with_state(:moderation).ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  def publish
    @article = Article.find(params[:id])
    @article.publish!

    redirect_to moderation_articles_path
  end

  def update
    @article = ModerationArticleType.find(params[:id])
    if @article.update(article_params)
      redirect_to moderation_articles_path
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :category_id, :state_event)
  end
end