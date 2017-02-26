require 'sinatra'
require_relative 'output_json.rb'

get "/" do
  erb :get_name
end

post '/post_name' do
  user_hash = params[:user]
  # "Got it: #{user_hash}"
  write_json(user_hash)
  backend_name = user_hash["user_name"]  # get user_name from hash
  # "Thanks for the info: #{backend_name}"
  erb :get_age, locals: {:name => backend_name}
end

post '/post_age' do
  user_hash = params[:user]
  # "Got it: #{user_hash}"
  append_json(user_hash)
  user_details = read_json()
  backend_name = user_details["user_name"]
  backend_age = user_details["user_age"]
  # "#{backend_name}, I see you are #{backend_age}."
  erb :get_numbers, locals: {:name => backend_name, :age => backend_age}
end

post '/post_numbers' do
  user_hash = params[:user]
  # "Got it: #{user_hash}"
  append_json(user_hash)
  user_details = read_json()
  backend_name = user_details["user_name"]
  backend_age = user_details["user_age"]
  one = user_details["num_1"]
  two = user_details["num_2"]
  three = user_details["num_3"]
  "Got it, #{backend_name}. You are #{backend_age} and your favorite numbers are #{one}, #{two} and #{three}."
end

