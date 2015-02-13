require 'sinatra/partial'
class VisitingCard < Sinatra::Base
  register Sinatra::Partial

  set :partial_template_engine, :erb
  set :public_folder => "public", :static => true
  set :partial_underscores, true

  get "/" do
    erb :welcome
  end
end
