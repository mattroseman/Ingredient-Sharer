require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'creates comment successfully (nominal case) with valid input' do
    comment = Comment.create
  end
end
