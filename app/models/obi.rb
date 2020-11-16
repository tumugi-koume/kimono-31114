class Obi < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :obi_name
  belongs_to :tpo
  belongs_to :material
  belongs_to :user
  has_one_attached :image

  validates :obi_name_id, presence: true, numericality: { other_than: 1 }
  validates :image,       presence: true
end
