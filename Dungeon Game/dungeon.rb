# text based game which has rooms relative to each other and in the future could add items within each rooms.

class Dungeon 
  attr_accessor :player 

  def initialize(player_name)
  	@player = Player.new(player_name)
  	@rooms = []
  end	

   def add_room(reference, name, description, connections)
  	@rooms << Room.new(reference, name, description, connections)
  end

  def start(location)
  	@player.location = location
  	show_current_description
  end

  def show_current_description
  	puts find_room_in_dungeon(@player.location).full_description 
  end

  def find_room_in_dungeon(reference)
  	@rooms.detect { |room| room.reference == reference}
  end

  def find_room_in_direction(direction)
  	find_room_in_dungeon(@player.location).connections[direction]
  end

  def go(direction)
  	puts "You go" + direction.to_s
  	@player.location = find_room_in_direction(direction)
  	show_current_description
  end
  
  class Player
    attr_accessor :name, :location 

    def initialize(player_name)
    	@name = player_name
    end
  end
	
  class Room
  	attr_accessor :reference, :name, :description, :connections

  	def initialize(reference, name, description, connections)
  		@reference = reference
  		@name = name 
  		@description = description 
  		@connections = connections
  	end

  	def full_description
  		@name + "\n\nYou are in " + @description
  	end
  end
end

# create the main dungeon
my_dungeon = Dungeon.new("Iron Fire")

# add rooms 

my_dungeon.add_room(:blindcave, "Blind Cave", "an enormous cave you can't see anything in", {:east => :rubycave })
my_dungeon.add_room(:rubycave, "Ruby Cave", "a cave full of rubies trust me this ain't gonna be easy", {:west => :blindcave})

my_dungeon.start(:rubycave)
