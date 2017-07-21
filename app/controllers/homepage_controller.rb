get '/homepage' do
  @decklist = Deck.all # update this later
  erb :'homepage/index'
end
