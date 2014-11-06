# simple sqllite3 database implementation 

require 'rubygems'
require 'sqlite3'

$db = SQLite3::Database.new('new')
$db.results_as_hash = true 

def disconnect_and_quit
  $db.close
  puts "Please come again!"
end

def create_database
  $db.execute %q{
    CREATE TABLE birthdays (
    id integar primary key, 
    name varchar(50),
    age integar,
    DOB varchar(50));
  }
end

def add_person
  print "Please enter a name:"
  name = gets.chomp
  puts "Please enter an age:"
  age = gets.chomp
  puts "Please enter a DOB:"
  dob = gets.chomp

  $db.execute("INSERT INTO birthdays (name, age, dob) VALUES (?, ?, ?)", name, age, dob)
end

create_database
add_person
disconnect_and_quit