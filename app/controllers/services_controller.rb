class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all

    if params[:query].present?
      @services = @services.global_search(params[:query])
    end

    @filtered_services = []
    @services_collection = Service.none

    @filtered_services << @services.where(monday: 1) if params[:monday].present?
    @filtered_services << @services.where(tuesday: 1) if params[:tuesday].present?
    @filtered_services << @services.where(wednesday: 1) if params[:wednesday].present?
    @filtered_services << @services.where(thursday: 1) if params[:thursday].present?
    @filtered_services << @services.where(friday: 1) if params[:friday].present?
    @filtered_services << @services.where(saturday: 1) if params[:saturday].present?
    @filtered_services << @services.where(sunday: 1) if params[:sunday].present?


    @filtered_services.each do |service|
      @services_collection = @services_collection.or(service)
    end
    @services = @services_collection if days_params_present?
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user

    if @service.save
      redirect_to service_path(@service)
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

  def show
  end

  def destroy
    @service.destroy if @service.user == current_user

    redirect_to services_path
  end

  private

  def days_params_present?
    params[:monday].present? || params[:tuesday].present? || params[:wednesday].present? || params[:thursday].present? || params[:friday].present? || params[:saturday].present? || params[:sunday].present?
  end

  def service_params
    params.require(:service).permit(:name, :description, :category_id, :location, :monday, :tuesday,
                                    :wednesday, :thursday, :friday, :saturday, :sunday)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
