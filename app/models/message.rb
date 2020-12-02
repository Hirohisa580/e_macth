class Message < ApplicationRecord
  belongs_to :user
  belongs_to :dm

  validates :message, presence: true
end
