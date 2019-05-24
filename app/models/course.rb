class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :locations

  validates :name,  presence: true, length: { maximum: 100 },
                    uniqueness: { case_sensitive: false }
  validates :prerequisite,  presence: true
  validates :desc,  presence: true, length: { maximum: 200 }
  validates :category_id,  presence: true
end
