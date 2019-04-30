class Location < ApplicationRecord
	has_and_belongs_to_many :courses
	validates :location, presence: true
end
