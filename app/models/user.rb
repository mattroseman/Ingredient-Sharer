class User < ActiveRecord::Base
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :secure_validatable

  validates :username, :uniqueness => true, :presence => {:message => 'Username cannot be blank'}
  validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }
  validates_uniqueness_of :email
  validates :email, :uniqueness => true, :presence => {:message => 'Email cannot be blank'}

  # Only allow letter, number, underscore and punctuation.

  # check format of username to not use email address of other user
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  # cheap fix found at https://github.com/phatworx/devise_security_extension/issues/54
  def login_changed?
    false
  end

  # enables user to sign in using their username OR email address
  # found at: https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign-in-using-their-username-or-email-address
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  # user-post connection
  has_many :posts,    dependent: :destroy

  # user-comment connection
  has_many :comments, dependent: :destroy
end
