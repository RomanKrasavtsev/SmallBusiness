class DashboardController < ApplicationController
  def index
    this_year_clients = Client.where( created_at: Time.now.beginning_of_year..Time.now.end_of_year.midnight )
    clients_by_months = this_year_clients.group_by { |c| c.created_at.beginning_of_month }

    @clients_months = [{
                        "name": t(:planned),
                        "data": {
                            t(:January) +' 2015'    => 1,
                            t(:February) + ' 2015'  => 2,
                            t(:March) + ' 2015'     => 3,
                            t(:April) + ' 2015'     => 4,
                            t(:May) + ' 2015'       => 5,
                            t(:June) + ' 2015'      => 6,
                            t(:July) + ' 2015'      => 7,
                            t(:August) + ' 2015'    => 8,
                            t(:September) + ' 2015' => 9,
                            t(:October) + ' 2015'   => 10,
                            t(:November) + ' 2015'  => 11,
                            t(:December) + ' 2015'  => 12
                        }}, 
                        { 
                            "name": t(:real), "data": {} 
                        }]
    
    clients_by_months.keys.sort.each do |month|
        @clients_months[1][:data][(t month.strftime("%B"), format: :short) + month.strftime(" %Y")] = clients_by_months[month].size
    end

    this_year_sales = Sale.where( created_at: Time.now.beginning_of_year..Time.now.end_of_year.midnight )
    sales_by_months = this_year_sales.group_by { |c| c.created_at.beginning_of_month }

    @sales_months = [{
                        "name": t(:planned),
                        "data": {
                            t(:January) +' 2015'    => 1,
                            t(:February) + ' 2015'  => 2,
                            t(:March) + ' 2015'     => 3,
                            t(:April) + ' 2015'     => 4,
                            t(:May) + ' 2015'       => 5,
                            t(:June) + ' 2015'      => 6,
                            t(:July) + ' 2015'      => 7,
                            t(:August) + ' 2015'    => 8,
                            t(:September) + ' 2015' => 9,
                            t(:October) + ' 2015'   => 10,
                            t(:November) + ' 2015'  => 11,
                            t(:December) + ' 2015'  => 12
                        }}, 
                        { 
                            "name": t(:real), "data": {} 
                        }]
    
    sales_by_months.keys.sort.each do |month|
        @sales_months[1][:data][(t month.strftime("%B"), format: :short) + month.strftime(" %Y")] = sales_by_months[month].size
    end

    @sales_by_products = this_year_sales
  end
end
