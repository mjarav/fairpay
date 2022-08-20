class BookingsController < ApplicationController
  before_action :set_service, only: [:new, :create]

    def index
    # @bookings = Booking.all
    @bookings = Booking.where(user_id: current_user)
    @my_bookings = []
    @my_services = Service.where(user_id: current_user).each do |my_service|
      @my_bookings << my_service.bookings
    end
    @my_bookings
  end

  def update
    @my_booking = Booking.find(params[:id])
    @my_booking.confirmation = true
    @my_booking.save

    redirect_to bookings_path
  end

  def new
    @booking = Booking.new

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.service = Service.find(params[:service_id])
    @booking.save!

    redirect_to service_path(@service), notice: "Your booking has been created"
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end, :user, :service_id)
  end

  def set_service
    @service = Service.find(params[:service_id])
  end

end
