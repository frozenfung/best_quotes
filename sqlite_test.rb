require "sqlite3"
require "rulers/sqlite_model"

class MyTable < Rulers::Model::SQLite
  def method_missing(meth, *args)
    return if @is_method_missing
    @is_method_missing = true

    self.class.schema.keys.each do |key|
      if "#{key.to_s}=" == meth.to_s
        self.class.send :define_method, "#{key}=" do |val|
          @hash[key.to_s] = val
        end

        @hash[key.to_s] = args[0]
        @is_method_missing = false
        return
      end

      if key.to_s == meth.to_s
        self.class.send :define_method, key do
          @hash[key.to_s]
        end

        @is_method_missing = false
        return @hash[key.to_s]
      end
    end

    super
  end

  # schema.keys.each do |key|
  #   define_method(key) do
  #     @hash[key.to_s]
  #   end

  #   define_method("#{key}=") do |val|
  #     @hash[key.to_s] = val
  #   end
  # end
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

puts "Title: #{mt2["title"]}"
