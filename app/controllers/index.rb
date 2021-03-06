get '/' do
  # Look in app/views/index.erb
  @categories = Category.all
  @best_of = Post.where(:OMGNSFWROFLYOLOLOLGTFO => true)
  erb :index
end

get '/category' do
  @category_id = params[:id]
  @category_name = Category.where(:id => @category_id).first[:title]
  @posts = Post.where(:category_id => @category_id)
  @title = @category_name

  erb :category
end

get '/post' do
  @post_id = params[:id]
  @post = Post.where(:id => @post_id).first
  @title = @post.title
  erb :post
end

get '/create_post' do
  @categories = Category.all
  erb :create_post
end

get '/edit_post' do
  found_posts = Post.where(:edit_key => params[:id])
  unless found_posts.empty?
    @post = found_posts.first 
    @id = @post.id
  end

  @categories = Category.all

  erb :edit_post
end

post '/post_created' do

  title = params[:title]
  description = params[:description]
  location = params[:location]
  price = params[:price]
  category_id = params[:category_id]
  id = params[:id]

  if id == '0'
    @edit_key = params[:title].hash.to_s(36)

    Post.create!(:title => title, :description => description, :location => location, 
      :price => price, :category_id => category_id, 
      :edit_key => @edit_key )

  else 
    Post.update(id, :title => title, :description => description, 
      :location => location, :price => price, :category_id => category_id)
    @edit_key = Post.where(:id => id).first[:edit_key]
  end

  erb :post_created
end

get '/best_of' do
  @best_of = Post.where(:OMGNSFWROFLYOLOLOLGTFO => true)
  erb :best_of
end
