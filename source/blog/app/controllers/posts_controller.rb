get "/posts" do
  @posts = Post.all
  erb :"posts/index"
end

get "/posts/new" do
  erb :"posts/new"
end

post "/posts" do
  post = Post.new(params)
  if post.save
    redirect to "/posts/#{post.id}"
  else
    redirect to "/posts/new"
  end
end

patch "/posts/:id" do
  post = Post.find(params[:id])
  if post && post.update(params[:giggles])
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
  post = Post.find(params[:id])
  if post.delete
    redirect to "/posts"
  else
    # what now?
  end
end

get "/posts/:id/delete" do
  @post = Post.find(params[:id])
  erb :"posts/delete"
end

get "/posts/:id" do
  @post = Post.find(params[:id])
  erb :"posts/show"
end
