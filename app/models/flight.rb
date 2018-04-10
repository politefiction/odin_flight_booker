class Flight < ApplicationRecord
    after_initialize :calculate_duration

    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"

    private
    def calculate_duration
        self.update_attribute(:duration, (Time.at(self.arrival - self.departure).utc.strftime("%H:%M:%S")))
    end
end