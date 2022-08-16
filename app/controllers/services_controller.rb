class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @services = Service.global_search(params[:query])
    else
      @services = Service.all
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user

    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @service.user == current_user
      if @service.update(service_params)
        redirect_to service_path(@service)
      else
        render :edit
      end
    end
  end

  def destroy
    @service.destroy if @service.user == current_user
    redirect_to service_path
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :category_id, :location, :monday, :tuesday,
                                    :wednesday, :thursday, :friday, :saturday, :sunday)
  end

  def set_bike
    @service = Service.find(params[:id])
  end
end
