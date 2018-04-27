class AddDurationToFlight < ActiveRecord::Migration[5.1]
  def change
    add_column :flight, :duration, :float
  end
end

