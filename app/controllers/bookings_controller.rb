class BookingsController < ApplicationController
  before_action :set_room, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @room.bookings.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to @booking.room, notice: "Booking successfully created"
    else
      redirect_to @booking.room, notice: "Retry please, end date must be after start date"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
