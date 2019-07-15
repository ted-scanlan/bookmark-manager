require 'sinatra/base'
require 'capybara'

class Bookmark < Sinatra::Base

  get '/' do
    erb :index
  end

  run! if app_file == $0

end
