class CommentsController < ApplicationController
  def new
  @campaign = Campaign.find(params[:campaign_id])
  @comment = @campaign.comments.build
  end

def create
  @campaign = Campaign.find(params[:campaign_id])
  @comment = @campaign.comments.build(comments_params)

  if @comment.save
    redirect_to @campaign,  notice: "Se agrego con exito"
  else
    render :new
  end
end

def destroy
  @campaign = Campaign.find(params[:campaign_id])
  @comment = @campaign.comments.find(params[:id])
  @comment.destroy
  redirect_to @campaign,  notice: "Se borro con exito"
end

protected

  def comments_params
      params.require(:comment).permit!
  end

end
