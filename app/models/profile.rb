class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :genre_one
  belongs_to :genre_two
  belongs_to :genre_three

  with_options presence: true do
    validates :nickname
    validates :age
    validates :birthday
    validates :history
    validates :public_relation
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :genre_one_id
  end
end
