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

  def self.stat(user_id)

  end

end
