class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many   :guesses




  def self.get(user_id,deck_id)
    Round.where(user_id: user_id)
# return Round object
  end

  def question
    # return guess object
  end

  def finish?
    # true or false
  end

  def stat
#  return hash
  end

  def deck_name
    self.deck.name
  end

  #first draws looks queries guess table and looks for questions that have no guesses
  self.deck.cards.all
  self.guesses.count < self.deck.cards.all.count
  self.guesses
  #second it will query for questions where answer are !correct that only have one guess
  #thirdit will query for questions where answer are !correct that only have second guess .....
  #exit condition is Query all question with true = card counts
end

