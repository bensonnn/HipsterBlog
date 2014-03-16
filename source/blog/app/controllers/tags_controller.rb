before '/tags' do
  redirect to '/' unless logged_in?
end

before '/tags/*' do
  redirect to '/' unless logged_in?
end

get '/tags' do
  @tags = Tag.active
  erb :'tags/index'
end

get '/tags/:name' do
  @tag = Tag.find_by_name(params[:name])
  erb :'tags/tag'
end

