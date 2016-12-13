class DonationsController < ApplicationController

  def new
  @campaign = Campaign.find(params[:campaign_id])
  @donation = @campaign.donations.build
  end

def create
  @campaign = Campaign.find(params[:campaign_id])
  @donation = @campaign.donations.build(donations_params)

  if @donation.save
    redirect_to @campaign,  notice: "Se agrego con exito"
  else
    render :new
  end
end

def destroy
  @campaign = Campaign.find(params[:campaign_id])
  @donation = @campaign.donations.find(params[:id])
  @donation.destroy
  redirect_to @campaign,  notice: "Se borro con exito"
end

protected

  def donations_params
      params.require(:donation).permit!
  end

end
