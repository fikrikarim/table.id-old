class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :slug, presence: true

  belongs_to :user
  has_many :comments

  acts_as_votable

  include FriendlyId
  friendly_id :title, :use => [:slugged]
end
