class Flight < ApplicationRecord
    before_create :calculate_duration

    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"

    private
    def calculate_duration
        duration = Time.at(self.arrival - self.departure)
        self.duration = duration.utc.strftime("%H:%M:%S")
    end
end

# May need to refine duration calculation again