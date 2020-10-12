# Describes an Cat
class Cat
  ### CLASS DEFINITIONS ###

  # class variables
  @@all = []

  # class methods
  def self.all
    @@all
  end


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor  :owner, :mood
  attr_reader :name

  # default constructor
  def initialize(name=nil, owner=nil)
    @name = name
    self.owner = owner
    self.mood = "nervous"
    self.save
  end

  # save the instance to the class variable all
  def save
    self.class.all << self
  end

  # Feeds the cat and makes it happy
  def feed
    self.mood = "happy"
  end

  # Sells the cat and makes it nervous
  def sell
    self.mood = "nervous"
    self.owner = nil
  end
end