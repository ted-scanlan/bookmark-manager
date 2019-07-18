require 'sinatra/base'
require 'capybara'
require './lib/bookmark.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end


  post '/adding' do
    # url = params[:url]
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")

    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  run! if app_file == $0

end
