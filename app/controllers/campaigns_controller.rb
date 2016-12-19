class CampaignsController < ApplicationController
  skip_before_action :authenticate, only: [:index, :show, :category]

  def index
    @campaigns = Campaign.active.order(:created_at)
  end

  def show
    @campaign = Campaign.find(params[:id])
    @user = User.find_by(id: @campaign.user_id)
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id
    @campaign.cant_like = 0

    if @campaign.save
      UserNotifierMailer.campaign_create(current_user, @campaign).deliver
      redirect_to dashboard_path, notice: "Se agrego exitosamente."
    else
      render :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])

    if @campaign.update_attributes(campaign_params)
      if current_user.receive_email
        UserNotifierMailer.campaign_edit(current_user, @campaign).deliver
      end
      redirect_to campaign_path(@campaign),  notice: "Se edito con exito."
    else
      render :edit
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to campaigns_path,  notice: "Se borro con exito."
  end

  def category
    @campaigns = Campaign.where(["category like ?", params[:category]])
    @category = params[:category].to_s
  end

  def dashboard
    @campaigns = Campaign.where(["user_id = ?", current_user.id])
  end

  protected

  def campaign_params
    params.require(:campaign).permit!
  end
end
