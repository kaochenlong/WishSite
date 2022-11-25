# frozen_string_literal: true

class Order < ApplicationRecord
  include AASM
  belongs_to :wish_list
  belongs_to :user

  validates :serial, presence: true, uniqueness: true

  before_validation :generate_serial

  aasm column: 'state', no_direct_assignment: true do
    state :pending, initial: true
    state :paid, :cancelled, :refunded

    event :pay do
      transitions from: :pending, to: :paid
    end

    event :cancel do
      transitions from: %i[pending refunded], to: :cancelled
    end

    event :refund do
      transitions from: :paid, to: :refunded
    end
  end

  private

  def generate_serial
    self.serial = SecureRandom.alphanumeric(12)
  end
end
