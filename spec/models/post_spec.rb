require 'rails_helper'

RSpec.describe Post, :type => :model do
  it 'creates post successfully (nominal case) with valid input' do
    post = Post.create(
        title: "test title",
        content: "test content",
        location: "user location",
        ttl: 10,
        user_id: 1
    )
      
    expect(post.save!).to equal true
  end
  
  it 'should reject null title field' do
    post = Post.create(
        
        content: "test content",
        location: "user location",
        ttl: 10,
        user_id: 1
    )
      
    expect{ post.save! }.to raise_error
  end
  
  it 'can contain null content field' do
    post = Post.create(
        title: "test title",

        location: "user location",
        ttl: 10,
        user_id: 1
    )
      
    expect(post.save!).to equal true
  end
  
  it 'should reject null ttl value' do
    post = Post.create(
        title: "test title",
        content: "test content",
        location: "user location",
        
        user_id: 1
    )
      
    expect{ post.save! }.to raise_error
  end
  
  it 'should reject negative ttl value' do
    post = Post.create(
        title: "test title",
        content: "test content",
        location: "user location",
        ttl: -1,
        user_id: 1
    )
      
    expect{ post.save! }.to raise_error
  end
  
  it 'should reject ttl value too high' do
    post = Post.create(
        title: "test title",
        content: "test content",
        location: "user location",
        ttl: 255,
        user_id: 1
    )
      
    expect{ post.save! }.to raise_error
  end
end
