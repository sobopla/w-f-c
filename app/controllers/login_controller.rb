get '/login' do
  erb :login
end

post '/login' do
  # check if filled out username
  # for testing purposes
  # if username is present assume logged in.
  logged_in = true

  # @user = User.authenticate(params[:username],params[:password])
  if logged_in
    # session[:user_id] = @user.id
    redirect '/'
  else
    @error = "Invalid entry. Try again."
    erb :'/login'
  end
end


# @user = User.authenticate(params[:username],params[:password])
#   if @user
#     session[:user_id] = @user.id
#     redirect '/'
#   else
#     @error = "Invalid entry. Try again."
#     erb :'/login'
#   end
# end
#we will need a logout clickable link
get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
