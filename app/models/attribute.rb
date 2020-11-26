class Attribute < ApplicationRecord
  belongs_to :type
  has_one_attached :icon
  validates :name, presence: true
  validates :numerical, presence: true, format: { with: /\A\d+\z/, message: "Integer only. No sign allowed." }
  validates :icon, presence: true
end
