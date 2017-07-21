get '/register' do
  erb :register
end

post '/register' do
  @user = User.create(params[:user])
      redirect '/login'
end
