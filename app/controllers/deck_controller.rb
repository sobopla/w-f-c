get '/round/:title' do
  round = Round.where(["deck_id = ?","#{params[:deck_id]}"])
  erb :'/round/display'
end
