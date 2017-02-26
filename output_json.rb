require 'json'

def write_json(user_hash)
  File.open("public/user.json","w") do |f|
    f.write(JSON.pretty_generate(user_hash))
  end
end

def append_json(user_hash)
  data_from_json = JSON[File.read('public/user.json')]
  File.open("public/user.json","w") do |f|
    f.write JSON.pretty_generate(data_from_json.merge(user_hash))
  end
end

def read_json()
  data_from_json = JSON[File.read('public/user.json')]
end

# Sandbox testing:
# user_name = {"user_name" => "John"}
# user_age = {"user_age" => "41"}
# numbers = {"one" => "100"}
# more_numbers = {"two" => "200", "three" => "300"}

# write_json(user_name)  # use to create JSON file, then use append_json to add to file
# append_json(user_age)
# append_json(numbers)
# append_json(more_numbers)

# data_from_json = JSON[File.read('public/user.json')]

# p data_from_json