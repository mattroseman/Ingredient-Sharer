require 'rails_helper'

RSpec.describe MarkovModel, type: :model do
  it 'has no entry for foo bar in the database' do
    expect(MarkovModel.where(:word => 'foo', :next_word => 'bar').size).to eq(0)
  end

  it 'adds new state correctly when creating post' do
    post = Post.create!(
      title: 'test_title',
      content: 'foo bar',
      location: 'test_location',
      ttl: 1,
      is_request: 1,
      user_id: 1
    )

    expect(MarkovModel.where(:word => 'foo', :next_word => 'bar')).to have_attributes(:count => 1)
  end

  it 'updates a states count when creating post' do
    Post.create!(
      title: 'test_title',
      content: 'foo bar',
      location: 'test_location',
      ttl: 1,
      is_request: 1,
      user_id: 1
    )

    expect(MarkovModel.where(:word => 'foo', :next_word => 'bar')).to have_attributes(:count => 2)
  end

  it 'ignores any characters except [0-9A-Za-z\']' do
    Post.create!(
      title: 'test_title',
      content: '({[@#$%Matt\'s word^&*-=_+;:<>,./\|\'"]})',
      location: 'test_location',
      ttl: 1,
      is_request: 1,
      user_id: 1
    )

    expect (MarkovModel.where(:word => 'Matt\'s', :next_word => 'word')).to have_attributes(:count => 1)
  end

  it 'creates an initial state entry for sentence beginnings' do
    Post.create!(
      title: 'test_title',
      content: 'First sentence. Second sentence! Third sentence? Fourth sentence',
      location: 'test_location',
      ttl: 1,
      is_request: 1,
      user_id: 1
    )

    expect (MarkovModel.where(:word => '', :next_word => 'First')).to have attributes(:count => 1)
    expect (MarkovModel.where(:word => '', :next_word => 'Second')).to have attributes(:count => 1)
    expect (MarkovModel.where(:word => 'sentence', :next_word => 'Second').size).to eq(0)
    expect (MarkovModel.where(:word => '', :next_word => 'Third')).to have attributes(:count => 1)
    expect (MarkovModel.where(:word => 'sentence', :next_word => 'Third').size).to eq(0)
    expect (MarkovModel.where(:word => '', :next_word => 'Fourth')).to have attributes(:count => 1)
    expect (MarkovModel.where(:word => 'sentence', :next_word => 'Fourth').size).to eq(0)
  end
end
