enable :session

get '/' do
  erb :index
end

post '/' do
  username = params[:login][:username].downcase
  password = params[:login][:password]
  if user = User.find_by_username(username)
    if user.authenticate(password)
      session[:username] = username
      session[:login] = true
      redirect to "/users/#{username}"
    else
      session[:password_error] = true
    end
  else
    session[:username_error] = true
  end
  redirect to '/'
end

get '/new' do
  erb :new
end

post '/new' do
  username = params[:login][:username].downcase
  password = params[:login][:password]
  if User.find_by_username(username)
    session[:username_error] = true
    redirect to '/new'
  else
    User.create(username: username) do |user|
      user.password = password
    end
    session[:username] = username
    redirect to "/users/#{username}"
  end
end

get '/logout' do
  session[:login] = false
  p session
  redirect to '/'
end

def logged_in?
  if session[:login] == true
    true
  else
    session[:login_error] = true
    false
  end
end
