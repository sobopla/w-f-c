get '/login' do
  erb :login
end

post '/login' do
@user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @error = "Invalid entry. Try again."
    erb :'/login'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end
