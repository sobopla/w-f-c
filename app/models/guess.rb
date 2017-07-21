class Guess < ApplicationRecord
  belongs_to :round
  belongs_to :card

  def question
    self.card.question
  end

  def answer
    self.card.answer
  end

  # we will be receiving string response
  # evaluate if answer is true
  # update correct field on guess object
  # backend keeps track
  # return
  def self.update(guess_id,answer)
    self
  end



end



