# encrypts a string by shitfting each letter in the string by a fixed number of positions up or down the alphabet. For example, "a" with a shift of 1 will become "b".

class Caesar 
  attr_accessor :text, :shift

  def initialize(text, shift)
    @text = text
    @shift = shift 
    @low = ("a".."z").to_a
    @caps = ("A".."Z").to_a
  end

  def shift
    @text.chars.collect do |ch|
      if !ch.ord.between?(65, 90) && !ch.ord.between?(97, 122)
        ch
      elsif ch == ch.downcase
        @low[(@low.index(ch) + @shift) % 26]
      else 
        @caps[(@caps.index(ch) + @shift) % 26]
      end
    end
  end

  def final
      shift.join
  end
end

test = Caesar.new("My name is Jake", 5)
p test.final

