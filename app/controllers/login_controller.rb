get '/login' do
  redirect to("/") if session[:user_id]
  @decks = ["Deck1", "Deck2"]
  # @decks = deck.list
  erb :login
end

post '/login' do
  redirect to("/") if session[:user_id]
 @user = User.authenticate(params[:username],params[:password])
  if @user != nil
    session[:user_id] = @user.id
    redirect ("/")
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
