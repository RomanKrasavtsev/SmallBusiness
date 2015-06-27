class DashboardController < ApplicationController
  def index
  	@clients = Client.order("description").all
  	@clients_months = @clients.group_by { |c| c.strftime("%B %Y") }
  end
end
