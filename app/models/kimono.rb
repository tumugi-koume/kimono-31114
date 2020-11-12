class Kimono < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :kimono_name

  validates :kimono_name_id, numericality: { other_than: 1 }
end
