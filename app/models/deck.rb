class Deck < ApplicationRecord
  has_many :cards
  belongs_to :round
end
