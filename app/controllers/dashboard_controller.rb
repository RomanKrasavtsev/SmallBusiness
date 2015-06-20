class DashboardController < ApplicationController
  def index
  	@clients = Client.order(:description)
  end
end
