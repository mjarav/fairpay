class ServicesController < ApplicationController
  def index
    if params[:query].present?
      # sql_query = "name @@ :query OR location @@ :query OR descritpion @@ :query"
      #  @bikes = Bike.where(sql_query, query: "%#{params[:query]}%")
        @services = Service.search_by_name_and_location_and description(params[:query])
    else
        @services = Service.all
    end
  end
end
