class ServicesController < ApplicationController
  def index

    if params[:query].present?
      raise
      @services = Service.global_search(params[:query])
    else
      @services = Service.all
    end
  end
end
