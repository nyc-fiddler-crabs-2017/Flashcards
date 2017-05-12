get '/rounds/:id' do
  @round = Round.find_by(id: params[:id])
  @cards_array = @round.deck.cards
  @filtered = card_filter(@round, @cards_array)
  erb :"/decks/#{@round.deck.id}"
end
