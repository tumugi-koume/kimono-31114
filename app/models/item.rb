class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_name
  belongs_to :tpo
  belongs_to :material
  belongs_to :user
  has_one_attached :image

  validates :item_name_id, presence: true, numericality: { other_than: 1 }
  validates :image,       presence: true
end
