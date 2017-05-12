get '/' do
  erb :'/users/index'
end

get '/' do
  erb :'/users/new'
end

post '/users' do

end

get '/users/:id' do
  erb :'/users/show'
end

get '/users/:id/edit' do
  erb :'/users/edit'
end

put '/users/:id' do

end

delete '/users/:id' do

end
