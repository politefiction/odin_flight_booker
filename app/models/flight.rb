class Flight < ApplicationRecord
    attr_accessor :num_passengers
    before_create :calculate_duration

    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"
    # has_many :bookings
    # has_many :passengers, through: :bookings
    # accepts_nested_attributes_for :bookings, limit: 250? idk

    def self.search(from_airport, to_airport, departure)
        ap_from = Airport.find_by(name: "#{from_airport}").id
        ap_to = Airport.find_by(name: "#{to_airport}").id
        d_date = Flight.convert_to_datetime(departure)
        where("from_airport_id = ? AND to_airport_id = ? AND departure LIKE ?", ap_from, ap_to, "%#{d_date}%")
    end

    private
    def calculate_duration
        duration = Time.at(self.arrival - self.departure)
        self.duration = duration.utc.strftime("%H:%M:%S")
    end

    def self.convert_to_datetime(d)
        time_array = d.split("/")
        time_array.insert(0, time_array.delete_at(2)).join("-")
    end
end

# May need to refine duration calculation again