get '/login' do
  @decks = ["Deck1", "Deck2"]
  # @decks = deck.list
  erb :login
end

post '/login' do
 @user = User.authenticate(params[:username],params[:password])
  if @user
    session[:user_id] = @user.id
    erb :'/deck/show'
  else
    @error = "Invalid entry. Try again."
    erb :'/login'
  end
end
#we will need a logout clickable link
get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
