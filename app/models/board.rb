class Board < ApplicationRecord
  belongs_to :profile
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre_one

  with_options presence: true do
    validates :name
    validates :explanation
  end
end
