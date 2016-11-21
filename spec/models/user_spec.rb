require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'creates user successfully (nominal case) with truthy password' do
    user = User.create(
        username: 'someguy',
        email: 'test@example.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd'
    )

    expect( user.valid_password?('P@ssw0rd') ).to be_truthy
  end

  it 'should reject incorrect email format with no (given) password' do
    expect { User.create!(email: 'incorrect_format', password: 'P@ssw0rd') }.to raise_error
  end

  it 'should reject password that does not include a special character' do
    expect { User.create!(email: 'correct@format.com', password: 'Password123') }.to raise_error
  end

  it 'should require username' do
    u = User.create!(email: 'correct@email.com', password: 'P@ssw0rd!', username: 'someguy')
    expect(u.username).to eq 'someguy'
  end

  it 'should reject a duplicate username' do
    user = User.create(
        username: 'someguy',
        email: 'test@example.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd'
    )

    expect { User.create(
        username: 'someguy',
        email: 'another_test@example.com',
        password: 'someP4SSW0RD',
        password_confirmation: 'someP4SSW0RD'
    ).save! }.to raise_error
  end

  it 'should reject a duplicate email' do
    user = User.create(
        username: 'someguy',
        email: 'someguy_test_duplicate_email@example.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd'
    )

    expect { same_email_user = User.create(
        username: 'otherguy',
        email: 'someguy_test_duplicate_email@example.com',
        password: 'someP4SSW0RD',
        password_confirmation: 'someP4SSW0RD'
    ).save! }.to raise_error
  end

  it 'should reject mismatching password confirmation pair' do
    expect { User.create(
        username: 'someguy',
        email: 'some_guy@gmail.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd123'
    ).save! }.to raise_error
  end

  it 'should not allow whitespace in username' do
    expect { User.create(
        username: 'some guy',
        email: 'some_guy@gmail.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd'
    ).save! }.to raise_error
  end

  it 'should be able to log in with email' do
    user = User.create(
        username: 'someguy',
        email: 'some_guy@gmail.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd'
    ).save!

  end
end