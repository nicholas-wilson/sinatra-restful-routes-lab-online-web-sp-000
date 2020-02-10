class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get 'recipes/:id/edit' do
    binding.pry
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  delete 'recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect '/recipes'
  end

  patch 'recipes/:id' do
    binding.pry
  end
end
