class Computer
    @@users = {}
    def initialize(username, password)
        @username = username
        @password = password
        @files = {}
        @@users[username] = password
    end
    
    def create(filename)
        time = Time.now
        @files[filename] = time
        puts "#{filename} was created by #{@username} at #{time}."
    end
    
    def update_filename(filename, updated_filename)
        time = Time.now
        @files[filename] = @files[updated_filename]
        @files[updated_filename] = time
        puts "#{filename}'s filename was updated to #{updated_filename} by #{@username} at #{time}"
    end
        
    def delete_file(filename)
        @files[filename] = @files.delete(filename)
        puts "#{filename} was successfully deleted."
    end
    
    def get_users
        # return @@users
        puts @@users
    end
end

my_computer = Computer.new("Seema", "pass")

puts "What is your username?"
  username = gets.chomp
puts "what is your password?"
  password = gets.chomp

puts "What would you like to do:  View users, create a file, delete a file, or update a filename? Type 'view' 'create' 'delete' or 'update':"

  choice = gets.chomp
  choice.downcase!

case choice
  when "view"
    my_computer.get_users
      
  when "create"
    puts "Please type a filename for the new .txt file you'd like to create:"
      filename = gets.chomp
      my_computer.create(filename)

  when "delete"
    puts "Please type the filename of the file you'd like to delete:"
      filename = gets.chomp
      my_computer.delete_file(filename)
    
  when "update"
    puts "Please type the current name of the file whose name you'd like to update:"
      filename = gets.chomp
    puts "Please type an updated filename for #{filename}:"
      updated_filename = gets.chomp
      my_computer.update_filename(filename, updated_filename)
end

     