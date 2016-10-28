require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates user successfully' do
    user = User.create(
        email: 'test@example.com',
        password: 'P@ssw0rd',
        password_confirmation: 'P@ssw0rd'
    )
    expect(user.valid_password?('P@ssw0rd')).to be_truthy
  end
end