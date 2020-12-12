class Attribute < ApplicationRecord
  belongs_to :type
  has_one_attached :icon
  validates :name, presence: true
  validates :numerical, presence: true, numericality: { only_integer: true }
end
