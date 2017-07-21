get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(params[:user])
      redirect '/login'
end
