# apparently i'm obssessed with birthdays. stores birthdays in YAML

require 'yaml'

class Birthdays
  attr_accessor :jacob, :duncan, :nick 
  
  def initialize
    @jacob = "22 May 1991"
    @duncan = "13 May 1988"
    @nick = "18 February 1985"
  end
  
  def serialize
    variables = {jacob: @jacob, duncan: @duncan, nick: @nick}
    yaml = YAML::dump(variables)
    mode = "w+"
    file = open("yaml.yml", mode)
    file.write("#{yaml}")
    file.close
  end

  def to_s
    "#{@jacob} #{@nick}"
  end
end

class Load
  def initialize
    read = File.read("yaml.yml")
    yaml = YAML::load(read)
    @jacob = yaml[:jacob]
    @nick = yaml[:nick]
    @duncan = yaml[:duncan] 
  end

  def start
    puts @jacob
    puts @nick
    puts @duncan
  end
end

start = Birthdays.new
File.truncate("yaml.yml", 0)
start.serialize
load = Load.new
load.start