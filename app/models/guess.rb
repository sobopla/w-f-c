class Guess < ApplicationRecord
  belongs_to :round
  belongs_to :card

  def question
    self.card.question
  end

  def answer
    self.card.answer
  end

  def self.update_information(guess_id, answer)
    guess = Guess.find_by_id(guess_id)
    guess.update_attribute(correct: true) if guess.answer == answer
  end



end

