require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite
  schema.keys.each do |key|
    define_method(key) do
      @hash[key.to_s]
    end

    define_method("#{key}=") do |val|
      @hash[key.to_s] = val
    end
  end
end

STDERR.puts MyTable.schema.inspect


# mt = MyTable.create "title" => "It happened!", "posted" => 1, "body" => "It did!"

# mt = MyTable.create "title" => "I saw it!"

# puts "Count: #{MyTable.count}"


# Create row
# mt = MyTable.create "title" => "I saw it again!"
# mt["title"] = "I really did!"
# mt.save!

mt2 = MyTable.find 80

puts mt2.title

mt2.title = rand(26)
mt2.save

puts mt2.title



# puts "Title: #{mt2["title"]}"
