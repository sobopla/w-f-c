class Deck < ApplicationRecord
  has_many :cards
  has_many :rounds

  # return array of deck names
  def self.list
    Deck.all.pluck(:name)
  end

end
