get '/round/:id' do
  puts "Am i really here !?!?!?!?!?!?!?!?!?!!!!!!!!!!!!!!!!!!"
  deck_id = params[:id]
  user_id = session[:user_id]
  round = Round.get(user_id,deck_id)
  @guess = round.question
  erb :"round/show"
end
