class Menu < ApplicationRecord
  belongs_to :restaurant
  has_many :selections, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 1, maximum: 300 }
end
