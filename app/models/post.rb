class Post < ActiveRecord::Base
  # TTL range validation (1 ≤ ttl ≤ 24)
  validates :ttl, :inclusion => 1..24

  validates_presence_of :title

  # user-post connection
  belongs_to :user

  # post-comment connection
  has_many :comments, dependent: :destroy
end
