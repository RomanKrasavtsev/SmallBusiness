class DashboardController < ApplicationController
  def index
    this_year_clients = Client.where( created_at: Time.now.beginning_of_year..Time.now.end_of_year.midnight )
    clients_by_months = this_year_clients.group_by { |c| c.created_at.beginning_of_month }

    @clients_months = [{ "name": "Planned",
                        "data": {
                            'January 2015':   1,
                            'February 2015':  2,
                            'March 2015':     3,
                            'April 2015':     4,
                            'May 2015':       5,
                            'June 2015':      6,
                            'July 2015':      7,
                            'August 2015':    8,
                            'September 2015': 9,
                            'October 2015':   10,
                            'November 2015':  11,
                            'December 2015':  12 
                        }}, 
                        { "name": "Real", "data": {} }]
    
    clients_by_months.keys.sort.each do |month|
        @clients_months[1][:data][month.strftime("%B %Y")] = clients_by_months[month].size
    end
  end
end
