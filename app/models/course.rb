class Course < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :locations
  has_many :votes, dependent: :destroy
 
  mount_uploader :picture, PictureUploader
  validates :name,  presence: true, length: { maximum: 100 },
                    uniqueness: { case_sensitive: false }
  validates :description,  presence: true, length: { maximum: 200 }
  validates :category_id,  presence: true
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
