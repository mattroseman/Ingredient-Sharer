require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'creates comment successfully (nominal case) with valid input' do
    post = Comment.create()
  end
end
