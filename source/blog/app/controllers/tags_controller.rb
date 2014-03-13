get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

get '/tags/:name' do
  @tag = Tag.find_by_name(params[:name])
  erb :'tags/tag'
end

