class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :locations
  has_many :votes, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 100 },
                    uniqueness: { case_sensitive: false }
  validates :description,  presence: true, length: { maximum: 200 }
  validates :category_id,  presence: true

  def score
	votes.sum(:vote_type)
  end
end
