class Card < ApplicationRecord
  belongs_to :deck
  belongs_to :guess
end
