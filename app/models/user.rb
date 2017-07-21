class User < ApplicationRecord
  has_many :rounds
  has_many :decks, through: :rounds

  validates :username, :email, presence:true, uniqueness: true
  validates :password_hash, presence:true
  include BCrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == password
      return user
    else
      nil
    end
  end

  # profile page stat
  # return array with each game as each hash
  # User.rounds # all the user's rounds

  def profile_stat(user_id)
    Deck.find_all.where
  end


end


# [ {deck_name: "Query this",
#     Round: [ {date: "query date",
#               card_in_deck: "query total cards",
#               first_guess_correct: "query",
#               total_guesses: "query" },
#               {date: "query date",
#               card_in_deck: "query total cards",
#               first_guess_correct: "query",
#               total_guesses: "query" },
#             ]
#   },
#   {deck_name: "Query this",
#     Round: [ {date: "query date",
#               card_in_deck: "query total cards",
#               first_guess_correct: "query",
#               total_guesses: "query" },
#             ]
#   }
# ]
