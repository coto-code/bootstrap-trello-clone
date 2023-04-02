class Card < ApplicationRecord
  belongs_to :list
  acts_as_list scope: :list

  validates :name, presence: true
end
