class Kimono < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :kimono_name
  belongs_to :kimono_genre
  belongs_to :tpo
  belongs_to :material

  validates :kimono_name_id, numericality: { other_than: 1 }
end
