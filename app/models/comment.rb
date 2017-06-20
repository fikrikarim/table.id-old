class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :post, counter_cache: true
  has_ancestry
  acts_as_votable
end
