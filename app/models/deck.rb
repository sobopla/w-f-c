class Deck < ApplicationRecord
  has_many :cards
  has_many :rounds


  def self.list
    Deck.all
  end

end
