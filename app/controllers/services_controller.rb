class ServicesController < ApplicationController
  def index
    if params[:monday].present?
      # @services = Service.global_search(params[:monday])
      @services = Service.where(params[:monday])
      # @services = Service.global_search(params[:query])
    else
      @services = Service.all
    end
  end
end
