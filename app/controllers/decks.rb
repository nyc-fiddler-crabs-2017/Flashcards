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
  # @round = Round.where(user_id: session[:user_id], deck_id: params[:id]).last
  # # binding.pry
  # @deck = @round.deck_id
  # @cards_array = @round.deck.cards
  # # @filtered = @round.card_filter(@round, @cards_array)
  # @question = @cards_array[rand(@cards_array.length)]
  erb :'/decks/show'
end

post '/decks/:deck_id/cards/:card_id' do
  @round = Round.where(user_id: session[:user_id], deck_id: params[:deck_id]).last
  @guess = Guess.new(attempt: params[:answer], card_id: params[:card_id], round_id: @round.id)
  @deck = params[:deck_id]
  @card = Card.find_by(id: params[:card_id])
  if @guess.save
      if @round.guesses.last.attempt == @question.answer
        @round.deck.cards.delete(@card)
        erb :'/decks/show'
      else
        @user_response = "incorrect"
        @filtered = @round.card_filter(@round, @cards_array)
        @question = @filtered[rand(@filtered.length)]
        erb :'/decks/show'
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
