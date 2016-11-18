require 'rails_helper'

RSpec.describe Post, :type => :model do
  it 'creates post successfully (nominal case) with valid input' do
    post = Post.create()
  end
end
