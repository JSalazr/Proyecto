class CommentsController < ApplicationController
  def new
  @campaign = Campaign.find(params[:campaign_id])
  @comment = @campaign.comments.build
  end

def create
  @campaign = Campaign.find(params[:campaign_id])
  @comment = @campaign.comments.build(comments_params)
  @user = User.find_by(id: @campaign.user_id)

  if @comment.save
    if @user.receive_email
      UserNotifier.new_comment(@user).deliver
    end
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
