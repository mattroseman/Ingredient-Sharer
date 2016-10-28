class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable

  #  cheap fix found at https://github.com/phatworx/devise_security_extension/issues/54
  def login_changed?
    false
  end
end
