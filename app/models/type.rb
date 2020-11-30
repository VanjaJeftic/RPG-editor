class Type < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :attributes_association, class_name: 'Attribute', :dependent => :delete_all
  validates :name, presence: true


end
