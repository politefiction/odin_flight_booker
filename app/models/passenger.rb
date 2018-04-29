class Passenger < ApplicationRecord
  #attr_accessor :id, :name, :email
  belongs_to :booking
  validates :name, presence: true
  validates :email, presence: true
end
