before '/posts' do
  redirect to '/' unless logged_in?
end

before '/posts/*' do
  redirect to '/' unless logged_in?
end

get "/posts" do
  p session
  @posts = Post.all
  erb :"posts/index"
end

get "/posts/new" do
  erb :"posts/new"
end

post "/posts" do
  tags = Tag.return_tag_objects(params[:tags])
  post = Post.new(params[:post])
  post.tags = tags
  if post.save
    redirect to "/posts/#{post.id}"
  else
    redirect to "/posts/new"
  end
end

patch "/posts/:id" do
  tags = Tag.return_tag_objects(params[:tags])
  post = Post.find(params[:id])
  post.tags = tags
  if post && post.update(params[:post])
    redirect to "/posts/#{post.id}"
  else
    redirect to "/posts/#{params[:id]}/edit"
  end
end

get "/posts/:id/edit" do
  @post = Post.find(params[:id])
  erb :"posts/edit"
end

delete "/posts/:id" do
  Post.find(params[:id]).delete
  redirect to "/posts"
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :"posts/show"
end

post "/get_rating" do
  HipsterRater::Post.raw_score_array(params[:arr]).to_s
end

