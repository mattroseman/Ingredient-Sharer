class Post < ActiveRecord::Base
  # TTL range validation (1 ≤ ttl ≤ 24)
  validates :ttl, :inclusion => 1..24

  # user-post connection
  belongs_to :user
end
