require 'sinatra'
require_relative 'output_json.rb'

class PersonalDetailsJSONApp < Sinatra::Base

  get "/" do
    erb :get_name
  end

  post '/post_name' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    # "Got it: #{user_hash}"  # testing - validate the contents of user_hash (user_name only)
    write_json(user_hash)  # save user_hash to a new JSON file (delete & re-create if already present)
    backend_name = user_hash["user_name"]  # get user_name from hash for listing in get_age.erb
    # "Thanks for the info: #{backend_name}"
    erb :get_age, locals: {:name => backend_name}  # pass user_name value to get_age.erb
  end

  post '/post_age' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    # "Got it: #{user_hash}"  # testing - validate the contents of user_hash (user_age only)
    append_json(user_hash)  # update the JSON file with user_hash (technically - ready, combine & add)
    user_details = read_json()  # load the hash from the JSON file to access values
    backend_name = user_details["user_name"]  # get user_name from hash for listing in get_numbers.erb
    backend_age = user_details["user_age"]  # get user_age from hash for listing in get_numbers.erb
    # "#{backend_name}, I see you are #{backend_age}."
    erb :get_numbers, locals: {:name => backend_name, :age => backend_age}  # pass user_name & user_age values to get_numbers.erb
  end

  post '/post_numbers' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    # "Got it: #{user_hash}"  # testing - validate the contents of user_hash (num_1, num_2 & num_3 only
    append_json(user_hash)  # update the JSON file with user_hash (technically - ready, combine & add
    user_details = read_json()  # load the hash from the JSON file to access values
    backend_name = user_details["user_name"]  # get user_name from hash for string output
    backend_age = user_details["user_age"]  # get user_age from hash for string output
    one = user_details["num_1"]  # get num_1 from hash for string output
    two = user_details["num_2"]  # get num_2 from hash for string output
    three = user_details["num_3"]  # get num_3 from hash for string output
    "Got it, #{backend_name}. You are #{backend_age} and your favorite numbers are #{one}, #{two} and #{three}."  # verify JSON file contents
  end

end