class Course < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :locations
  has_many :votes, dependent: :destroy
 
  mount_uploader :picture, PictureUploader
  validates :name,  presence: true, length: { minimum: 10, maximum: 100 },
                    uniqueness: { case_sensitive: false }
  validates :prerequisite,  presence: true, length: { minimum: 10 }
  validates :description,  presence: true, length: { minimum: 30, maximum: 200 }
  validate :picture_size

  def score
	votes.sum(:vote_type)
  end

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
