class Web::Articles::Comments::ApplicationController < Web::Articles::ApplicationController
  def resource_comment
    @comment ||= resource_article.comments.find(params[:comment_id])
  end
end
