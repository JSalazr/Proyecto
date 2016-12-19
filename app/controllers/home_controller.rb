class HomeController < ApplicationController
  skip_before_action :authenticate

  def index
    @campaigns = Campaign.where(["finalizado_en > ?", Date.today]).order(:cant_like)
  end
end
