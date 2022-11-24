class Order < ApplicationRecord
  belongs_to :wish_list
  belongs_to :user

  validates :serial, presence: true, uniqueness: true

  before_validation :generate_serial

  private

  def generate_serial
    self.serial = SecureRandom.alphanumeric(12)
  end
end
