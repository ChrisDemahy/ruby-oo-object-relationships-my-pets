# Describes an Owner
class Owner
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all Owners

  # Reader for all class variable
  def self.all
    @@all
  end  

  # Returns the number(count) of owners stored in the class
  def self.count
    self.all.uniq.count
  end

  # Clears all the owners from the class
  def self.reset_all
    self.all.clear
  end

  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_reader :name, :species

  # default constructor
  def initialize(name=nil)
    @name = name
    @species = "human"
    self.save
  end

  # saves Owner instance to all class variable
  def save
    self.class.all << self
  end

  # returns the species of the owner
  def say_species
    "I am a #{self.species}."
  end

  # returns all the cats associated with this owner
  def cats
    Cat.all.find_all do |cat|
      cat.owner == self
    end
  end

  # returns all the dogs associated with this owner
  def dogs
    Dog.all.find_all do |dog|
      dog.owner == self
    end
  end

  # creates a new cat and associates it with owner
  def buy_cat(cat_name)
    Cat.new(cat_name, self) # self #=> owner
  end

  # creates a new dod and associates it with this owner
  def buy_dog(dog_name)
    Dog.new(dog_name, self) # self #=> owner
  end

  # Walk all dogs associated with this owner
  def walk_dogs
    self.dogs.each { |dog| dog.walk }
  end

  # Feeds all the cats associated with the owner
  def feed_cats
    self.cats.each { |cat| cat.feed }
  end

  # Sells all the pets associated with this owner
  def sell_pets
    self.dogs.each{|dog| dog.sell}
    self.cats.each{|cat| cat.sell}
  end

  # Puts all the pets names associated with the owner
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end