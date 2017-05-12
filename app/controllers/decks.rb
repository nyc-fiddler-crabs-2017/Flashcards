get '/decks' do
  redirect '/'
end

get '/decks/new' do
  erb :'/decks/new'
end

post '/cards' do
  deck = Deck.find_by
  card = Card.find_by(answer: params[:answer])
  if card
    deck.cards = deck.cards - [card]
    @response = "correct"
  else
    @reponse = "incorrect"
  end
end

post '/decks' do
  @deck = Deck.new(title: params[:title])
  if @deck.save
    redirect '/'
  else
    @errors = @deck.errors.full_messages
    erb :'/decks/new'
  end
end

get '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  @round = @deck.round
  @cards_array = @round.deck.cards
  @filtered = card_filter(@round, @cards_array)
  erb :'/decks/show'
end

get '/decks/:id/edit' do
  @deck = Deck.find_by(id: params[:id])
  erb :'/decks/edit'
end

put '/decks/:id' do
  @deck = Deck.find_by(id: params[:id])
  if @deck.update_attribute(title: params[:title])
    redirect '/'
  else
    @errors = @deck.errors.full_messages
    erb :'/decks/edit'
  end
end

delete '/decks/:id' do
  deck = Deck.find_by(id: params[:id])
  deck.destroy!
  redirect '/'
end
