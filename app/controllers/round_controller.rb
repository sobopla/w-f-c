get '/round/:id' do
  # puts "Am i really here !?!?!?!?!?!?!?!?!?!!!!!!!!!!!!!!!!!!" puts does not work
  deck_id = params[:id]
  user_id = session[:user_id]
  round = Round.get(user_id,deck_id)
  @guess = round.question
  erb :"round/show"
end

post '/round/:id' do 
	#check result against correct answer
	#correct or wrong
	#
	"Display next card"

	# :erb /round/:id/show_result # needs to show the result of the guess 
	# 

end