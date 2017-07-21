get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(params[:user])
  if @user.valid?
    redirect '/login'
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end
