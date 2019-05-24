# PHASE 2
def convert_to_int(str)
  Integer(str)
  rescue ArgumentError
    nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]
class CoffeeError < ArgumentError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise CoffeeError if maybe_fruit == "coffee"
    raise ArgumentError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
    rescue CoffeeError
      puts "Well it's not what I asked for, but I do like coffee! :)"
      retry
    rescue ArgumentError
      puts "Grrrrr that isn't fruit!"
  end
end  

# PHASE 4
class ShortFriendshipError < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError, "Best friend must have a name" if name.length <= 0
    raise ShortFriendshipError, "Too short a time to be best friends (< 5 years)" if yrs_known < 5
    raise ArgumentError, "Best friends must have a favorite pastime" if fav_pastime.length <= 0

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


