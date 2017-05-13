get '/rounds/:id' do
  @round = Round.find_by(id: params[:id])
  @cards_array = @round.deck.cards
  @filtered = card_filter(@round, @cards_array)
  erb :"/decks/#{@round.deck.id}"
end

post '/rounds' do
  @round = Round.new(user_id: session[:user_id],
                     deck_id: params.keys)
  if @round.save
    @deck = Deck.find_by(id: params.keys)
    @question = @deck.cards[rand(@deck.cards.length)]
    erb :'/decks/show'
  else
    @errors = @round.errors.full_messages
    erb :'index'
  end
end
