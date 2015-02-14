require 'sinatra/partial'
class VisitingCard < Sinatra::Base
  register Sinatra::Partial

  set :partial_template_engine, :erb
  set :public_folder => "public", :static => true
  set :partial_underscores, true

  get "/" do
    erb :welcome
  end

  post "/contact" do
    Pony.mail({
      :to => 'yarfilyk@gmail.com',
      :from => params[:email],
      :subject => "New notification from your site!",
      :body => "Name: #{params[:name]}\nPhone: #{params[:phone]}\n\nQuestion:\n'#{params[:message]}'",
      :via => :smtp,
      :via_options => {
        :address => "smtp.mailgun.org",
        :port => 587,
        :domain => "yaroslavfilyk.herokuapp.com",
        :user_name => ENV['MAILGUN_USER_NAME'],
        :password => ENV['MAILGUN_USER_PASSWORD'],
        :authentication => :plain # :plain, :login, :cram_md5, no auth by default
      }
    })
    redirect "/"
  end
end
