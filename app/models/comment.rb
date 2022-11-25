# frozen_string_literal: true

class Comment < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :wish_list

  validates :content, presence: true
end
