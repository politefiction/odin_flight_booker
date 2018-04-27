class Passenger < ApplicationRecord
  attr_accessor :name, :email
  belongs_to :booking
end
