class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :password_confirmation, presence: true
  validates :password, presence:true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    return nil if email == nil
    @user = User.find_by_email(email.downcase.strip)
    @user && @user.authenticate(password) ? @user : nil
  end
end

