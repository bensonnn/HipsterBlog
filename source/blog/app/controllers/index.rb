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
      redirect to "/users/#{username}"
    else
      session[:password_error] = 'incorrect password'
    end
  else
    session[:username_error] = 'username not found'
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
    session[:username_error] = 'username already taken'
    redirect to '/new'
  else
    User.create(username: username) do |user|
      user.password = password
    end
    session[:username] = username
    redirect to "/users/#{username}"
  end
end
