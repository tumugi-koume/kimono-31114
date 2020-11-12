class Kimono < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :kimono_name
end
