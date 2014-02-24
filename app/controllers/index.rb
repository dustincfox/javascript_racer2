get '/' do
  # Look in app/views/index.erb
  @categories = Category.all #.map{|category| category.name}
  erb :index
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  @posts = @category.posts
  erb :category
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])
  erb :edit_post
end

post '/posts/edit/:id' do
  @post_id = params[:id]
  @post = Post.find(@post_id)
  params["post"].each{|k,v| if v != ""; @post.send(k+"=",v);end}
  @post.save
  redirect("/posts/#{@post.id}")
end

get '/posts/create' do
  erb :create_post
end

post '/posts/create' do
  @args = {}
  params["post"].each{|k,v| @args[k.to_sym] = v }
  @new_post = Post.create(@args)
  erb :create_confirmation
end



get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post
end



