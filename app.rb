require 'sinatra/base'
require 'capybara'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])     # need to put in id: here as its what enables the self.delete method to put in the id params in as an argument.
    redirect '/bookmarks'

  end


  post '/adding' do
    # url = params[:url]
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")

    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]   #why does it save the id here when in erb its not in a name variable?
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do

   Bookmark.update(id: params[:id], url: params[:url], title: params[:title])

    redirect '/bookmarks'
    #Bookmark.update

  end


  run! if app_file == $0

end
