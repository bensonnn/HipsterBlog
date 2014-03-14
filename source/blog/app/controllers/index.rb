require 'byebug'

get '/' do
  # Look in app/views/index.erb
  erb :index, locals: { posts: Post.all }
end

get '/show/:post_id' do 
  post = Post.where(id: params[:post_id])[0]
  erb :show_post, locals: { post: post }
end

get '/posts_by_tag/:tag_id' do
  tag = Tag.where(id: params[:tag_id])
  posts = tag[0].posts
  erb :posts_by_tag, locals: { tag: tag, tagged_posts: posts }
end

get '/create_post' do
  erb :create_post
end

post '/create_post' do

  new_post = Post.create(title: params[:title], body: params[:body])
  params[:tag].split(', ').each do |tag_name|
    new_post.tags << Tag.create(name: tag_name)
  end
  redirect to "/show/#{new_post.id}"
end

get '/edit_post/:post_id' do
  post = Post.find(params[:post_id])
  erb :edit_post, locals: { post: post }
end

post '/edit_post' do
  tags_array = params[:tags].split(', ').map { |tag_name| Tag.find_by_name(name: tag_name) }


  # post = Post.find(params[:id])
  # tags_array = []
  # p params[:tags]
  # byebug
  # params[:tags].split(', ').each do |tag_name|
  #   tags_array << Tag.create(name: tag_name)
  # end
  # params.merge({tags: tags_array})
  post.update(params)
  # params[:tag].split(', ').each do |tag_name|
  #   new_post.tags << Tag.create(name: tag_name)
  # end
  redirect to "/show/#{post.id}"
end
