class Web::Articles::Comments::LikesController < Web::Articles::Comments::ApplicationController
  def create
    @comment = Article::Comment.find(params[:comment_id])

    case LikeMutator.create!(@comment)
    when Some
      flash.notice = "Your like has been created!"
    when None
      flash.alert = "Too many likes per hour!!!"
    end

    redirect_to article_path(@comment.article)
  end
end


