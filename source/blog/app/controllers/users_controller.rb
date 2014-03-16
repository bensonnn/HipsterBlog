before '/users' do
  redirect to '/' unless logged_in?
end

before '/users/*' do
  redirect to '/' unless logged_in?
end

get '/users/:username' do
  if user = User.find_by_username(params[:username])
    @posts = user.posts
    erb :"posts/index"
  else
    redirect '/posts'
  end
end
