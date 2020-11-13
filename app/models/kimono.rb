class Kimono < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :kimono_name
  belongs_to :kimono_genre
  belongs_to :tpo
  belongs_to :material
  belongs_to :user
  has_one_attached :image

  validates :kimono_name_id, presence: true, numericality: { other_than: 1 }
  validates :image,          presence: true
end
