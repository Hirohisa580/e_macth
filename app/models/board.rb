class Board < ApplicationRecord
  has_many :profile_boards
  has_many :profiles, through: :profile_boards
  has_many :comments


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_one

  with_options presence: true do
    validates :name
    validates :explanation
  end
end
