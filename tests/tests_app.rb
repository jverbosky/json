require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'

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

  def test_post_nam
    post '/post_name', user: "John"
    assert(last_response.ok?)
    # assert(last_response.body.include?('{"user_name" => "John"}'))
  end

  # def test_get_age
  #   get '/age?u_name=JV'
  #   assert(last_response.ok?)
  #   assert(last_response.body.include?('Hello JV, what is your age?'))
  #   assert(last_response.body.include?('<form method="post" action="post_age?user_n=JV'))
  #   assert(last_response.body.include?('<input type="text" name="user_a">'))
  # end

  # def test_post_age_multiple_values_redirect
  #   post '/post_age?user_n=john_v', user_a: '41'
  #   follow_redirect!
  #   assert(last_response.ok?)
  #   assert(last_response.body.include?('john_v'))
  #   assert(last_response.body.include?('41'))
  # end

  # def test_get_numbers
  #   get '/numbers?u_n=jverb&u_a=41'
  #   assert(last_response.ok?)
  #   assert(last_response.body.include?('Hello jverb, I see you are 41.  What are your favorite numbers?'))
  #   assert(last_response.body.include?('<form method="post" action="post_numbers?un=jverb&ua=41">'))
  #   assert(last_response.body.include?('<input type="text" name="num_1">'))
  #   assert(last_response.body.include?('<input type="text" name="num_2">'))
  #   assert(last_response.body.include?('<input type="text" name="num_3">'))
  # end

  # def test_post_numbers_multiple_values_redirect
  #   post '/post_numbers?un=JCV&ua=41', num_1: '10', num_2: '20', num_3: '30'
  #   follow_redirect!
  #   assert(last_response.ok?)
  #   assert(last_response.body.include?('JCV'))
  #   assert(last_response.body.include?('41'))
  #   assert(last_response.body.include?('10'))
  #   assert(last_response.body.include?('20'))
  #   assert(last_response.body.include?('30'))
  # end

  # def test_get_results_multiple_values_redirect
  #   get '/results?n=Johnny&a=41&n1=100&n2=200&n3=300'
  #   assert(last_response.ok?)
  #   assert(last_response.body.include?('Hello again Johnny.'))
  #   assert(last_response.body.include?('You are 41 years old.'))
  #   assert(last_response.body.include?('Your favorite numbers are 100, 200 and 300.'))
  #   assert(last_response.body.include?('The sum of your favorite numbers is 600, which is greater than your age.'))
  # end

end