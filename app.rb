require 'sinatra'
require_relative 'output_json.rb'

get "/" do
  erb :get_name
end

post '/post_name' do
  user_hash = params[:user]
  write_json(user_hash)
  backend_name = user_hash["user_name"]  # get user_name from hash
  # "Thanks for the info: #{backend_name}"
  erb :get_age, locals: {:name => backend_name}
end

post '/post_age' do
  user_hash = params[:user]
  write_json(user_hash)
  backend_age = user_hash["user_age"]
  "#{user_hash}."
end