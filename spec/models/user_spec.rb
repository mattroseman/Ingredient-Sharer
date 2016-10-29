require "rails_helper"

RSpec.describe User, :type => :model do
  it 'creates user successfully' do
    user = User.create(
        email: 'test@example.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd'
    )
    expect(user.valid_password?('P@ssw0rd')).to be_truthy
  end
  it "should reject incorrect email format with no (given) password" do
    expect { User.create!(email: "incorrect_format", password: "P@ssw0rd") }.to raise_error
  end

  it "should reject password that does not include a special character" do
    expect { User.create!(email: "correct@format.com", password: "Password123")}.to raise_error
  end
end