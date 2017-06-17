class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user
  has_many :comment

  acts_as_votable

end
