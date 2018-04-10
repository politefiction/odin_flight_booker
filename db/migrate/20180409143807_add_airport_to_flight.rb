class AddAirportToFlight < ActiveRecord::Migration[5.1]
  def change
    add_reference :flights, :from_airport, foreign_key: { to_table: :airport }
    add_reference :flights, :to_airport, foreign_key: { to_table: :airport }
  end
end
