get '/register' do
  redirect to("/") if session[:user_id]
  erb :register
end

post '/register' do
  redirect to("/") if session[:user_id]
  @user = User.create(params[:user])
      redirect '/login'
end
