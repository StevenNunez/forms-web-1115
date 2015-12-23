require 'bundler/setup'
Bundler.require

class SecretSanta < Sinatra::Base
  @@participants = []
  get '/participants/new' do
    erb :"participants/new"
  end

  post '/participants' do
    @@participants << params[:participant]
    redirect "/participants"
  end

  get '/participants' do
    @participants = @@participants
    erb :"participants/index"
  end
end



run SecretSanta
