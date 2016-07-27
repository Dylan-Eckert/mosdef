class Restaurant < ApplicationRecord
  has_many :menus, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 1, maximum: 300 }
end
