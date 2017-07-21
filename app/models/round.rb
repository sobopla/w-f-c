class Round < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  has_many   :guesses
  has_many   :cards, through: :deck

  #
  def self.get(user_id,deck_id)
    round = Round.includes(:cards, :deck, :guesses).where(user_id: user_id, deck_id: deck_id).last
    if round.nil? || round.finished
      Round.create({deck_id:deck_id, user_id:user_id, finished:false})
      Round.includes(:cards, :deck, :guesses).find_by(user_id: user_id, deck_id: deck_id).last
    end
  end

  def question  # fix me later
    if self.guesses.empty?
      self.cards.each do |card|
        Guess.create({round_id:self.id,card_id:card.id,correct:false,attempts:0})
      end
    end
    x = 0
    while x < 10
      first_pass = self.guesses.select { |guess| (guess.attempts == x) && (guess.correct == false) }
      # array guesses that were incorrectly answered from previous round and not yet guessed in this round
      if !first_pass.empty?
        return Guess.includes(:card).find_by_id(first_pass.sample.id)
      end
      x +=1
    end
    # does this not have to stop in the middle? issue with x, will always be reset to 0 or
    # guess.correct == true
  end

  def finish?
    self.guesses.each do |guess|
      next if guess.correct == true
      return false
    end
    self.finished = true
  end

  def stat # we need to finish
    guesses = self.guesses.pluck(:attempts).reduce(:+)
    hash = {total_guesses: guesses, correct_first: 0}
  end

  def deck_name
    self.deck.name
  end
end

