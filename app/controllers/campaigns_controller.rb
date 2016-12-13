class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.active.order(:created_at)
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user_id = current_user.id

    if @campaign.save
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
  end

  def dashboard
    @campaigns = Campaign.where(["user_id = ?", current_user.id])
  end

  protected

  def campaign_params
    params.require(:campaign).permit!
  end
end
