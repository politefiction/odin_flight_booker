class Flight < ApplicationRecord
    attr_accessor :num_passengers
    before_create :calculate_duration

    belongs_to :from_airport, class_name: "Airport"
    belongs_to :to_airport, class_name: "Airport"
    has_many :bookings
    has_many :passengers, through: :bookings

    def self.search(from_airport, to_airport, departure)
        ap_from = Airport.find_by(name: "#{from_airport}").id
        ap_to = Airport.find_by(name: "#{to_airport}").id
        d_date = Flight.convert_to_datetime(departure)
        where("from_airport_id = ? AND to_airport_id = ? AND departure LIKE ?", ap_from, ap_to, "%#{d_date}%")
    end

    private
    def calculate_duration
        duration = Time.at(self.arrival - self.departure)
        self.duration = (duration.to_f/3600).round(2)
    end

    def self.convert_to_datetime(d)
        date_array = d.split("/")
        date_array.insert(0, date_array.delete_at(2)).join("-")
    end
end