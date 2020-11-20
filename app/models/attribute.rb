class Attribute < ApplicationRecord
  belongs_to :type
  has_one_attached :icon
end
