class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :vote_type, :inclusion => -1..1
  validates :course, uniqueness: { scope: :user }
  validates :user,   uniqueness: { scope: :course }
end
