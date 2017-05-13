get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
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
  @round = Round.where(user_id: session[:user_id], deck_id: params[:id])
  p @round
  # @deck = @round.deck_id
  # @cards_array = @round.deck.cards
  # @filtered = @round.card_filter(@round, @cards_array)
  # @question = @filtered[0]
  # erb :'/decks/show'
end

post '/decks/:deck_id/cards/:card_id' do
  @guess = Guess.new(attempt: params[:answer])
  @deck = Deck.find_by(id: params[:deck_id])
  @card = Card.find_by(id: params[:card_id])
  if @guess.save
    @card.guesses.each do |guess|
      if guess.attempt == @card.answer
        @user_response = "correct"
        erb :'/decks/show'
      else
        @user_response = "incorrect"
        erb :'/decks/show'
      end
    end
  else
    @errors = @guess.errors.full_messages
    erb :'/decks/show'
  end
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
