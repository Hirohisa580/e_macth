class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :genre_one
  belongs_to :genre_two
  belongs_to :genre_three
end
