class DashboardController < ApplicationController
  def index
    this_year_clients = Client.where( created_at: Time.now.beginning_of_year..Time.now.end_of_year.midnight )
    clients_by_months = this_year_clients.group_by { |c| c.created_at.beginning_of_month }

    @clients_months = [{
                        "name": t(:planned),
                        "data": {
                            t(:january) +' 2015'    => 1,
                            t(:february) + ' 2015'  => 2,
                            t(:march) + ' 2015'     => 3,
                            t(:april) + ' 2015'     => 4,
                            t(:may) + ' 2015'       => 5,
                            t(:june) + ' 2015'      => 6,
                            t(:july) + ' 2015'      => 7,
                            t(:august) + ' 2015'    => 8,
                            t(:september) + ' 2015' => 9,
                            t(:october) + ' 2015'   => 10,
                            t(:november) + ' 2015'  => 11,
                            t(:december) + ' 2015'  => 12
                        }}, 
                        { 
                            "name": t(:real), "data": {} 
                        }]
    
    clients_by_months.keys.sort.each do |month|
        @clients_months[1][:data][month.strftime("%B %Y")] = clients_by_months[month].size
    end
  end
end
