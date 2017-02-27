# all assertions passing with app_test_version.rb with all references to JSON methods and file content commented out
# see comments throughout app_test_version.rb to for specifics on what had to be commented out

require 'minitest/autorun'
require 'rack/test'
require_relative '../app_test_version.rb'

class TestApp < Minitest::Test
  include Rack::Test::Methods

  def app
    PersonalDetailsJSONApp
  end

  def test_get_entry_page
    get '/'
    assert(last_response.ok?)
    assert(last_response.body.include?('Hello, what is your name?'))
    assert(last_response.body.include?('<form  method = "post" action = "post_name">'))
    assert(last_response.body.include?('<input type = "text" name = "user[user_name]">'))
  end

  def test_post_name
    post '/post_name', {user: {user_name: 'John'}}  # figuring out that syntax took a bit...  ^~^
    assert(last_response.ok?)
    assert(last_response.body.include?('Hi John, what is your age?'))
    assert(last_response.body.include?('<form  method= "post" action = "post_age">'))
    assert(last_response.body.include?('<input type = "text" name = "user[user_age]">'))
  end

  def test_post_age
    post '/post_age', {user: {user_age: '41'}}
    assert(last_response.ok?)
    assert(last_response.body.include?('I see you are 41. What are your favorite numbers?'))
    assert(last_response.body.include?('<form method="post" action="post_numbers">'))
    assert(last_response.body.include?('<input type="text" name="user[num_1]">'))
    assert(last_response.body.include?('<input type="text" name="user[num_2]">'))
    assert(last_response.body.include?('<input type="text" name="user[num_3]">'))
  end

  def test_post_numbers
    post '/post_numbers', {user: {num_1: '10', num_2: '20', num_3: '30'}}
    assert(last_response.ok?)
    assert(last_response.body.include?('Your favorite numbers are 10, 20 and 30.'))
  end


end