require 'sinatra/base'
require 'capybara'
require_relative './lib/bookmark.rb'
require_relative './lib/database_connection_setup'
require_relative './lib/validate_url_module'
require 'sinatra/flash'
require_relative './lib/comment'

class BookmarkManager < Sinatra::Base

include UrlValidation
register Sinatra::Flash

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
    if is_valid?(params[:url])
      Bookmark.create(url: params[:url], title: params[:title])
    else
      flash[:notice] = "Error: invalid url"
    end
    redirect '/'


  end

  get '/bookmarks/:id/edit' do
    @bookmark_id = params[:id]   #why does it save the id here when in erb its not in a name variable?
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  get '/bookmarks/:id/comment' do
    @bookmark_id = params[:id]   #why does it save the id here when in erb its not in a name variable?
    # @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/comment'
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params[:text], bookmark_id: params[:id])
    redirect '/bookmarks'

  end

  patch '/bookmarks/:id' do

   Bookmark.update(id: params[:id], url: params[:url], title: params[:title])

    redirect '/bookmarks'
    #Bookmark.update

  end


  run! if app_file == $0

end
