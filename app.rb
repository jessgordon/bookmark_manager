require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/bookmark'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base 
  enable :sessions
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end
  enable :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    # flash[:notice] = "Invalid url"
    @bookmark_1 = Bookmark.all
    erb :bookmarks
  end

  post '/add-bookmark' do
    flash[:notice] = "Invalid url"
    Bookmark.add_bookmark(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  post '/delete-bookmark' do
    Bookmark.delete_bookmark(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/update'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect ('/bookmarks')
  end

  run! if app_file == $0
end