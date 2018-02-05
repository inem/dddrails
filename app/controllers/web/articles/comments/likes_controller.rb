class Web::Articles::Comments::LikesController < Web::Articles::Comments::ApplicationController
  def create
    if resource_valid?
      LikeMutator.create!(resource_comment)
    else
      flash.alert = "Too many likes per hour!!!"
    end
    redirect_to article_path(resource_article)
  end

  private

  def permitted_params
    params.permit(:article_id, :comment_id)
  end

  def resource_valid?
    LikeMutator.validate(resource_comment)
  end
end


