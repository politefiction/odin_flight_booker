class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :departure
      t.datetime :arrival

      t.timestamps
    end
  end
end
