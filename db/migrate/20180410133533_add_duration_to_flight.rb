class AddDurationToFlight < ActiveRecord::Migration[5.1]
  def change
    add_column :flights, :duration, :float
  end
end

