get '/decks' do
  redirect '/'
end

get '/decks/new' do
  erb :'/decks/new'
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
  erb :'/decks/show'
end

get '/decks/:id/edit' do
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
