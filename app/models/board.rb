class Board < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
