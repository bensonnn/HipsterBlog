get "/posts" do
  @posts = Post.all
  erb :"posts/index"
end
