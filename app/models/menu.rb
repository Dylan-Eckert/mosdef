class Menu < ApplicationRecord
  has_many :selections, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 1, maximum: 100 }
end
