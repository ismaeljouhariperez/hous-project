class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :end_date_after_start_date
  # validate :validate_booking_overlap // Deactivated for the seed

  private

  def end_date_after_start_date
    return if ends_at.blank? || starts_at.blank?

    if ends_at < starts_at
      errors.add(:ends_at, "must be after the start date")
    end
  end

  def validate_booking_overlap
    overlapping_bookings = room.bookings.where.not(id: id).where(
      "starts_at < ? AND ends_at > ?", ends_at, starts_at
    )

    if overlapping_bookings.exists?
      errors.add(:base, "Room is already booked for the selected dates")
    end
  end

end
