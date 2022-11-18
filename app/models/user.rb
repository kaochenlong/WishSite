class User < ApplicationRecord
  validates :email, presence: true
  validates :password,
             confirmation: true,
             length: { minimum: 6 }
end
