class Type < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :character_attributes, class_name: 'Attribute', dependent: :delete_all
  validates :name, presence: true
end
