require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/album')
require_relative('../models/artist')

get '/albums' do
  @albums = Album.all
  erb(:"albums/index")
end

get '/albums/new' do
  @artists = Artist.all
  erb(:"albums/new")
end

get '/albums/:id' do
  @album = Album.find(params[:id])
  erb(:"albums/show")
end

get '/albums/:id/edit' do
  @album = Album.find(params[:id])
  @artists = Artist.all
  erb(:"albums/edit")
end

post '/albums' do
  @album = Album.new(params)
  @album.save
  erb(:"albums/create")
end

post '/albums/:id' do
  @album = Album.find(params[:id])
  @album.update(params)
  redirect to "albums/#{params[:id]}"
end

post '/albums/:id/delete' do
  @album = Album.find(params[:id])
  @album.delete()
  redirect to "albums"
end