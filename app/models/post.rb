class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :slug, presence: true

  before_validation :update_weighted_score

  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable

  include FriendlyId
  friendly_id :title, :use => [:slugged]


  def update_weighted_score
    # check if some relevant variables have changed first, for example
   self.trending_score = real_weighted_score
  end

  $our_epoch = Time.local(2016, 11, 21).to_time

  def epoch_seconds(t)
    (t.to_i - $our_epoch.to_i).to_f
  end

  def real_weighted_score
    raw_score = self.get_upvotes.size
    order = Math.log([raw_score.abs, 1].max, 10)
    if raw_score > 0
        sign = 1
    elsif raw_score < 0
        sign = -1
    else
        sign = 0
    end
    # seconds = self.created_at.to_i - 1134028003
    return (order * sign.to_f) + ( epoch_seconds(self.created_at) / 45000 )
    # return ((order + sign * seconds / 45000)*7).ceil / 7.0
  end
end
