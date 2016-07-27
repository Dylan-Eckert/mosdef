class Selection < ApplicationRecord
  belongs_to :menu

  validates :name, presence: true, length: { minimum: 3 }
  validates :ingredients, presence: true, length: { minimum: 2 }
  validates :price, presence: true, length: { minimum: 2 }
end
