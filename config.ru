require 'bundler/setup'
Bundler.require

# class Participant < ActiveRecord::Base
#   #  name
#   has_many :gifts
# end
#
# class Gift < ActiveRecord::Base
#   # name, participant_id
#   belongs_to :participant
# end


class SecretSanta < Sinatra::Base
  # set :method_override, true
  enable :method_override
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

  delete '/participants' do
    @@participants.reject! {|p| p[:name] == params[:person_to_destroy]}
    redirect "/participants"
  end
end

run SecretSanta
