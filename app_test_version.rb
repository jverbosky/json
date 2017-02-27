require 'sinatra'
require_relative 'output_json.rb'

class PersonalDetailsJSONApp < Sinatra::Base

  get "/" do
    erb :get_name
  end

  post '/post_name' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    # "Got it: #{params}"  # testing - validate the contents of user_hash (user_name only)
    # comment out line 14 for tests_app.rb - causes assert(last_response.ok?) on line 22 to fail
    # write_json(user_hash)  # save user_hash to a new JSON file (delete & re-create if already present)
    backend_name = user_hash["user_name"]  # get user_name from hash for listing in get_age.erb
    # "Thanks for the info: #{backend_name}"
    erb :get_age, locals: {name: backend_name}  # pass user_name value to get_age.erb
  end

  post '/post_age' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    # "Got it: #{user_hash}"  # testing - validate the contents of user_hash (user_age only)
    # comment out line 24 for tests_app.rb - causes assert(last_response.ok?) on line 30 to fail
    # append_json(user_hash)  # update the JSON file with user_hash (technically - ready, combine & add)
    # comment out lines 26 & 27 for tests_app.rb - not using JSON
    # user_details = read_json()  # load the hash from the JSON file to access values
    # backend_name = user_details["user_name"]  # get user_name from hash for listing in get_numbers.erb
    # change user_details["user_age"] to user_hash["user_age"] for testing, since we're not using JSON
    backend_age = user_hash["user_age"]  # get user_age from hash for listing in get_numbers.erb
    # "#{backend_name}, I see you are #{backend_age}."
    # remove "name: backend_name, " from locals: since we're not using JSON, also use special get_numbers_testing.erb without name
    erb :get_numbers_testing, locals: {age: backend_age}  # pass user_name & user_age values to get_numbers.erb
  end

  post '/post_numbers' do
    user_hash = params[:user]  # assign the user hash to the user_hash variable
    # "Got it: #{user_hash}"  # testing - validate the contents of user_hash (num_1, num_2 & num_3 only
    # comment out line 39 for tests_app.rb - causes assert(last_response.ok?) on line 40 to fail
    # append_json(user_hash)  # update the JSON file with user_hash (technically - ready, combine & add
    # comment out lines 41 - 43 for tests_app.rb - not using JSON
    # user_details = read_json()  # load the hash from the JSON file to access values
    # backend_name = user_details["user_name"]  # get user_name from hash for string output
    # backend_age = user_details["user_age"]  # get user_age from hash for string output
    # change user_details["user_age"] to user_hash["user_age"] for testing, since we're not using JSON
    one = user_hash["num_1"]  # get num_1 from hash for string output
    two = user_hash["num_2"]  # get num_2 from hash for string output
    three = user_hash["num_3"]  # get num_3 from hash for string output
    "Your favorite numbers are #{one}, #{two} and #{three}."  # verify JSON file contents
  end

end