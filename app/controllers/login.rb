enable :sessions

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/login/#{@user.id}"
  else
    "nope"
  end
end

get '/login/:id' do
  @user = User.find_by(id: params[:id])
  erb :'/users/index'
end

get '/logout' do
  session.clear
  redirect '/'
end

