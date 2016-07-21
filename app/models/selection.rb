class Selection < ApplicationRecord
  validates :menu, presence: true, length: { minimum: 1 }
  validates :name, presence: true, length: { minimum: 1 }
  validates :ingredients, presence: true, length: { minimum: 1 }
  validates :price, presence: true, length: { minimum: 1 }
end
