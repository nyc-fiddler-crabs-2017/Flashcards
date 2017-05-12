enable :sessions

get '/login' do
  erb :'/login/login'
end

post '/login' do
  @user = User.find_by(email: params[:email_address])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    "nope"
  end
end

delete '/logout' do
  session.clear
  redirect '/'
end
