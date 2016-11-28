class Comment < ActiveRecord::Base
  # don't allow empty strings in comments
  validates :content, presence: true, allow_blank: false

  belongs_to :user
  belongs_to :post
end
