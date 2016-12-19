class DonationsController < ApplicationController
  skip_before_action :authenticate, only: [:new, :create]

  def new
  @campaign = Campaign.find(params[:campaign_id])
  @donation = @campaign.donations.build
  end

def create
  @campaign = Campaign.find(params[:campaign_id])
  @donation = @campaign.donations.build(donations_params)
  @user = User.find_by(id: @campaign.user_id)



  if @donation.save
    if @user.receive_email
      UserNotifierMailer.new_donation(@user, @donation, @campaign).deliver
    end
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
