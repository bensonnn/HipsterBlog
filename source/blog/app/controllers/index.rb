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
      redirect '/posts'
    else
      'your password was incorrect'
    end
  else
    "#{username} was not found"
  end
end

get '/new' do
  erb :new
end

post '/new' do
  username = params[:login][:username].downcase
  password = params[:login][:password]
  if User.find_by_username(username)
    'that username is already taken!'
  else
    User.create(username: username) do |user|
      user.password = password
    end
    session[:username] = username
    redirect to "/posts"
  end
end
