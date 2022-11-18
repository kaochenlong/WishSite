class User < ApplicationRecord
  validates :email, presence: true
  validates :password,
             confirmation: true,
             length: { minimum: 6 }

  before_create :encrypt_password

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("xy#{self.password.reverse}zz")
  end
end
