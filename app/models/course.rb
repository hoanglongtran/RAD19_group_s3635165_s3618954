class Course < ApplicationRecord
  belongs_to :location
  belongs_to :category
  belongs_to :user
  belongs_to :prerequisite
  validates :user_id, presence: true
  validates :name, presence: true
end
