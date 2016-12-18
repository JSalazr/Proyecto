class HomeController < ApplicationController
  def index
    @campaigns = Campaign.where(["finalizado_en > ?", Date.today]).order(:cant_like)
  end
end
