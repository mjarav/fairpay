class BookingsController < ApplicationController
  before_action :set_service, only: [:new, :create, :show]

  def index
    @bookings = current_user.bookings.includes(service: :category).order(start_date: :asc)

    @service_bookings = current_user.service_bookings.includes(service: :category).order(start_date: :asc)

  end

  def update
    @my_booking = Booking.find(params[:id])
    @my_booking.confirmation = true
    @my_booking.save
    redirect_to bookings_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accept!

    redirect_to bookings_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.decline!

    redirect_to bookings_path
  end

  def complete
    @booking = Booking.find(params[:id])
    @booking.complete!

    @provider = @booking.service.user
    @customer = @booking.user

    @provider.update(credit: (@provider.credit + 1))
    @customer.update(credit: (@customer.credit - 1))


    redirect_to bookings_path

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.service = Service.find(params[:service_id])
    if @booking.save

      redirect_to bookings_path, notice: "Your booking has been created"
    else
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end, :user, :service_id, :description)
  end

  def set_service
    @service = Service.find(params[:service_id])
  end
end
