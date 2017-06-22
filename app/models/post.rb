class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :slug, presence: true

  belongs_to :user
  has_many :comments

  acts_as_votable

  include FriendlyId
  friendly_id :title, :use => [:slugged]

  # Ranking algo
  # def raw_score
  #   return self.upvotes.size - self.downvotes.size
  # end

  # def weighted_score(weighted_score)
  #   raw_score = self.raw_score
  #   order = Math.log([raw_score.abs, 1].max, 10)
  #   if raw_score > 0
  #       sign = 1
  #   elsif raw_score < 0
  #       sign = -1
  #   else
  #       sign = 0
  #   end
  #   seconds = self.created_at.to_i - 1134028003
  #   return ((order + sign * seconds / 45000)*7).ceil / 7.0
  # end
end
