class Category < ApplicationRecord
	has_and_belongs_to_many :courses
	validates :category, presence: true
end
