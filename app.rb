require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base 
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmark_1 = Bookmark.all
    erb :bookmarks
  end

  post '/add-bookmark' do
    Bookmark.add_bookmark(params[:new_bookmark])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end