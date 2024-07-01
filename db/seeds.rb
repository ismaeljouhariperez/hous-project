require "faker"

Booking.destroy_all
Room.destroy_all
Hotel.destroy_all
User.destroy_all

user = User.create(email: "ismael@test.com", password: "azerty", password_confirmation: "azerty")

10.times do
  hotel = Hotel.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address
  )

  5.times do
    room = hotel.rooms.create!(
      price_per_night: Faker::Commerce.price(range: 38.0..94.0).round(2),
      capacity: Faker::Number.between(from: 1, to: 4)
    )

    2.times do
      start_date = Faker::Date.forward(days: 23)
      end_date = start_date + Faker::Number.between(from: 1, to: 5)
      room.bookings.create!(
        user: User.first,  # Using the first user for simplicity, replace as needed
        starts_at: start_date,
        ends_at: end_date
      )
    end
  end
end

puts "Data seeded successfully!"