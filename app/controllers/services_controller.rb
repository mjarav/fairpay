class ServicesController < ApplicationController
  def index
    if params[:query].present?
      @services = Service.global_search(params[:query])
    else
      @services = Service.all
    end
  end
end
