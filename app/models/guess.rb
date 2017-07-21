class Guess < ApplicationRecord
  belongs_to :round
  belongs_to :card

  def question
    self.card.question
  end

  def answer
    self.card.answer
  end

end



