class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user

  acts_as_votable

end
