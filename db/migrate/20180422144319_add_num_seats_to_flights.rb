class AddNumSeatsToFlights < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :num_seats, :integer, default: 250
  end
end
