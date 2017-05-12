enable :sessions

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    "nope"
  end
end

delete '/logout' do
  session.clear
  redirect '/'
end

